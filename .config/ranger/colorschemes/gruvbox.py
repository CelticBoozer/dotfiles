# Ranger color theme. Gruvbox dark style.

from __future__ import absolute_import, division, print_function

from ranger.gui.colorscheme import ColorScheme
from ranger.gui.color import (
    black,
    blue,
    cyan,
    green,
    magenta,
    red,
    white,
    yellow,
    default,
    normal,
    bold,
    reverse,
    default_colors,
)


class Gruvbox_dark(ColorScheme):
    progress_bar_color = 13

    def verify_browser(self, context, fg, bg, attr):
        if context.selected:
            attr = reverse
        else:
            attr = normal
        if context.empty or context.error:
            bg = 160
            fg = 232
        if context.border:
            fg = default
        if context.document:
            attr |= normal
            fg = 223
        if context.media:
            if context.image:
                attr |= normal
                fg = 184
            elif context.video:
                fg = 106
            elif context.audio:
                fg = 135
            else:
                fg = 106
        if context.container:
            attr |= bold
            fg = 160
        if context.directory:
            attr |= bold
            fg = 172
        elif context.executable and not any(
            (context.media, context.container, context.fifo, context.socket)
        ):
            attr |= bold
            fg = 105
        if context.socket:
            fg = 5
            attr |= bold
        if context.fifo or context.device:
            fg = 3
            if context.device:
                attr |= bold
        if context.link:
            fg = 111 if context.good else 13
        if context.tag_marker and not context.selected:
            attr |= bold
            if fg in (red, magenta):
                fg = 1
            else:
                fg = 15
        if not context.selected and (context.cut or context.copied):
            fg = 244
            attr |= bold
        if context.main_column:
            if context.selected:
                attr |= bold
            if context.marked:
                attr |= bold
                fg = 11
        if context.badinfo:
            if attr & reverse:
                bg = 5
            else:
                fg = 5

        if context.inactive_pane:
            fg = 6

        return fg, bg, attr

    def verify_titlebar(self, context, fg, bg, attr):
        attr |= bold
        if context.hostname:
            fg = 1 if context.bad else 2
        elif context.directory:
            fg = 111
        elif context.tab:
            if context.good:
                fg = 232
                bg = 111
        elif context.link:
            fg = 6

        return fg, bg, attr

    def verify_statusbar(self, context, fg, bg, attr):
        if context.permissions:
            if context.good:
                fg = 106
            elif context.bad:
                bg = 160
                fg = 232
        if context.marked:
            attr |= bold | reverse
            fg = 106
        if context.frozen:
            attr |= bold | reverse
            fg = 111
        if context.message:
            if context.bad:
                attr |= bold
                fg = 160
        if context.loaded:
            bg = self.progress_bar_color
        if context.vcsinfo:
            fg = 106
            attr &= ~bold
        if context.vcscommit:
            fg = 106
            attr &= ~bold
        if context.vcsdate:
            fg = 111
            attr &= ~bold

        return fg, bg, attr

    def verify_taskview(self, context, fg, bg, attr):
        if context.title:
            fg = 4

        if context.selected:
            attr |= reverse

        if context.loaded:
            if context.selected:
                fg = self.progress_bar_color
            else:
                bg = self.progress_bar_color

        return fg, bg, attr

    def verify_vcsfile(self, context, fg, bg, attr):
        attr &= ~bold
        if context.vcsconflict:
            fg = 135
        elif context.vcschanged:
            fg = 160
        elif context.vcsunknown:
            fg = 160
        elif context.vcsstaged:
            fg = 106
        elif context.vcssync:
            fg = 106
        elif context.vcsignored:
            fg = default

        return fg, bg, attr

    def verify_vcsremote(self, context, fg, bg, attr):
        attr &= ~bold
        if context.vcssync or context.vcsnone:
            fg = 2
        elif context.vcsbehind:
            fg = 1
        elif context.vcsahead:
            fg = 6
        elif context.vcsdiverged:
            fg = 5
        elif context.vcsunknown:
            fg = 1

        return fg, bg, attr

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            fg, bg, attr = self.verify_browser(context, fg, bg, attr)

        elif context.in_titlebar:
            fg, bg, attr = self.verify_titlebar(context, fg, bg, attr)

        elif context.in_statusbar:
            fg, bg, attr = self.verify_statusbar(context, fg, bg, attr)

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            fg, bg, attr = self.verify_taskview(context, fg, bg, attr)

        if context.vcsfile and not context.selected:
            fg, bg, attr = self.verify_vcsfile(context, fg, bg, attr)

        elif context.vcsremote and not context.selected:
            fg, bg, attr = self.verify_vcsremote(context, fg, bg, attr)

        return fg, bg, attr
