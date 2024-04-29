#!/bin/bash

# shellcheck disable=SC2034
set -o noclobber -o noglob -o nounset -o pipefail
IFS=$'\n'

# If the option `use_preview_script` is set to `true`,
# then this script will be called and its output will be displayed in ranger.
# ANSI color codes are supported.
# STDIN is disabled, so interactive scripts won't work properly

# This script is considered a configuration file and must be updated manually.
# It will be left untouched if you upgrade ranger.

# Because of some automated testing we do on the script #'s for comments need
# to be doubled up. Code that is commented out, because it's an alternative for
# example, gets only one #.

# Meanings of exit codes:
# code | meaning    | action of ranger
# -----+------------+-------------------------------------------
# 0    | success    | Display stdout as preview
# 1    | no preview | Display no preview at all
# 2    | plain text | Display the plain content of the file
# 3    | fix width  | Don't reload when width changes
# 4    | fix height | Don't reload when height changes
# 5    | fix both   | Don't ever reload
# 6    | image      | Display the image `$IMAGE_CACHE_PATH` points to as an image preview
# 7    | image      | Display the file directly as an image

# Script arguments
FILE_PATH="${1}" # Full path of the highlighted file
PV_WIDTH="${2}"  # Width of the preview pane (number of fitting characters)
# PV_HEIGHT is provided for convenience and unused
PV_HEIGHT="${3}"        # Height of the preview pane (number of fitting characters)
IMAGE_CACHE_PATH="${4}" # Full path that should be used to cache image preview
PV_IMAGE_ENABLED="${5}" # 'True' if image previews are enabled, 'False' otherwise.

FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER="$(printf "%s" "${FILE_EXTENSION}" | tr '[:upper:]' '[:lower:]')"

# Settings
HIGHLIGHT_SIZE_MAX=262143 # 256KiB
HIGHLIGHT_TABWIDTH=${HIGHLIGHT_TABWIDTH:-8}
HIGHLIGHT_STYLE=${HIGHLIGHT_STYLE:-pablo}
HIGHLIGHT_OPTIONS="--replace-tabs=${HIGHLIGHT_TABWIDTH} --style=${HIGHLIGHT_STYLE} ${HIGHLIGHT_OPTIONS:-}"
PYGMENTIZE_STYLE=${PYGMENTIZE_STYLE:-autumn}
OPENSCAD_IMGSIZE=${RNGR_OPENSCAD_IMGSIZE:-1000,1000}
OPENSCAD_COLORSCHEME=${RNGR_OPENSCAD_COLORSCHEME:-Tomorrow Night}

# Preview software rquired:
# - bsdtar(libarchive);
# - unrar;
# - 7z(p7zip);
# - mutool(mupdf-tools);
# - transmission-show(transmission-cli);
# - pandoc(pandoc-cli);
# - xlsx2csv;
# - jq;
# - convert(imagemagick);
# - calibre;
# - catdoc;
handle_extension() {
	case "${FILE_EXTENSION_LOWER}" in
	# Archive
	a | ace | alz | arc | arj | bz | bz2 | cab | cpio | deb | gz | jar | lha | lz | lzh | lzma | lzo | \
		rpm | rz | t7z | tar | tbz | tbz2 | tgz | tlz | txz | tZ | tzo | war | xpi | xz | Z | zip)
		bsdtar --list --file "${FILE_PATH}" && exit 5
		exit 1
		;;
	rar)
		# Avoid password prompt by providing empty password
		unrar lt -p- -- "${FILE_PATH}" && exit 5
		exit 1
		;;
	7z)
		# Avoid password prompt by providing empty password
		7z l -p -- "${FILE_PATH}" && exit 5
		exit 1
		;;
	# PDF
	pdf)
		mutool draw -F txt -i -- "${FILE_PATH}" 1-10 |
			fmt -w "${PV_WIDTH}" && exit 5
		exit 1
		;;
	# BitTorrent
	torrent)
		transmission-show -- "${FILE_PATH}" && exit 5
		exit 1
		;;
	# OpenDocument
	odt | ods | odp | sxw)
		# Preview as markdown conversion
		pandoc -s -t markdown -- "${FILE_PATH}" && exit 5
		exit 1
		;;
	# XLSX
	xlsx)
		# Preview as csv conversion
		# Uses: https://github.com/dilshod/xlsx2csv
		xlsx2csv -- "${FILE_PATH}" && exit 5
		exit 1
		;;
	# JSON
	json)
		jq --color-output . "${FILE_PATH}" && exit 5
		;;
	esac
}

handle_image() {
	# Size of the preview if there are multiple options or it has to be
	# rendered from vector graphics. If the conversion program allows
	# specifying only one dimension while keeping the aspect ratio, the width
	# will be used.
	local DEFAULT_SIZE="1080x720"
	local mimetype="${1}"

	case "${mimetype}" in
	# SVG
	image/svg+xml | image/svg)
		convert -- "${FILE_PATH}" "${IMAGE_CACHE_PATH}" && exit 6
		exit 1
		;;

	# DjVu
	image/vnd.djvu)
		ddjvu -format=tiff -quality=90 -page=1 -size="${DEFAULT_SIZE}" \
			- "${IMAGE_CACHE_PATH}" <"${FILE_PATH}" &&
			exit 6 || exit 1
		;;

	# Image
	image/*)
		local orientation
		orientation="$(identify -format '%[EXIF:Orientation]\n' -- "${FILE_PATH}")"
		# If orientation data is present and the image actually
		# needs rotating ("1" means no rotation)...
		if [[ -n "$orientation" && "$orientation" != 1 ]]; then
			# ...auto-rotate the image according to the EXIF data.
			convert -- "${FILE_PATH}" -auto-orient "${IMAGE_CACHE_PATH}" && exit 6
		fi
		exit 7
		;;

	# Video
	video/*)
	    # Thumbnail
	    ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6
	    exit 1;;

	# ePub, MOBI, FB2 (using Calibre)
	application/epub+zip|application/x-mobipocket-ebook|\
	application/x-fictionbook+xml)
	    # ePub (using https://github.com/marianosimone/epub-thumbnailer)
	    epub-thumbnailer "${FILE_PATH}" "${IMAGE_CACHE_PATH}" \
	        "${DEFAULT_SIZE%x*}" && exit 6
	    ebook-meta --get-cover="${IMAGE_CACHE_PATH}" -- "${FILE_PATH}" \
	        >/dev/null && exit 6
	    exit 1;;

	## Font
	application/font* | application/*opentype)
		preview_png="/tmp/$(basename "${IMAGE_CACHE_PATH%.*}").png"
		if fontimage -o "${preview_png}" \
			--pixelsize "120" \
			--fontname \
			--pixelsize "80" \
			--text "  ABCDEFGHIJKLMNOPQRSTUVWXYZ  " \
			--text "  abcdefghijklmnopqrstuvwxyz  " \
			--text "  0123456789.:,;(*!?') ff fl fi ffi ffl  " \
			--text "  The quick brown fox jumps over the lazy dog.  " \
			"${FILE_PATH}"; then
			convert -- "${preview_png}" "${IMAGE_CACHE_PATH}" &&
				rm "${preview_png}" &&
				exit 6
		else
			exit 1
		fi
		;;
	esac
}

handle_mime() {
	local mimetype="${1}"
	case "${mimetype}" in
	# RTF and DOC
	text/rtf | *msword)
		# Preview as text conversion
		# note: catdoc does not always work for .doc files
		# catdoc: http://www.wagner.pp.ru/~vitus/software/catdoc/
		catdoc -- "${FILE_PATH}" && exit 5
		exit 1
		;;

	## XLS
	*ms-excel)
		## Preview as csv conversion
		## xls2csv comes with catdoc:
		##   http://www.wagner.pp.ru/~vitus/software/catdoc/
		xls2csv -- "${FILE_PATH}" && exit 5
		exit 1
		;;

	## Text
	text/* | */xml)
		## Syntax highlight
		if [[ "$(stat --printf='%s' -- "${FILE_PATH}")" -gt "${HIGHLIGHT_SIZE_MAX}" ]]; then
			exit 2
		fi
		if [[ "$(tput colors)" -ge 256 ]]; then
			local pygmentize_format='terminal256'
			local highlight_format='xterm256'
		else
			local pygmentize_format='terminal'
			local highlight_format='ansi'
		fi
		env HIGHLIGHT_OPTIONS="${HIGHLIGHT_OPTIONS}" highlight \
			--out-format="${highlight_format}" \
			--force -- "${FILE_PATH}" && exit 5
		env COLORTERM=8bit bat --color=always --style="plain" \
			-- "${FILE_PATH}" && exit 5
		pygmentize -f "${pygmentize_format}" -O "style=${PYGMENTIZE_STYLE}" \
			-- "${FILE_PATH}" && exit 5
		exit 2
		;;
	esac
}

handle_fallback() {
	echo '----- File Type Classification -----' && file --dereference --brief -- "${FILE_PATH}" && exit 5
	exit 1
}

MIMETYPE="$(file --dereference --brief --mime-type -- "${FILE_PATH}")"
if [[ "${PV_IMAGE_ENABLED}" == 'True' ]]; then
	handle_image "${MIMETYPE}"
fi
handle_extension
handle_mime "${MIMETYPE}"
handle_fallback
