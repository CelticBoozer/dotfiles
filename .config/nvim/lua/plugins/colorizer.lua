-- require 'colorizer'.setup {
--   'conf' = {
--     RGB      = true;         -- #RGB hex codes
--     RRGGBB   = true;         -- #RRGGBB hex codes
--     names    = true;         -- "Name" codes like Blue
--     RRGGBBAA = true;        -- #RRGGBBAA hex codes
--     rgb_fn   = true;        -- CSS rgb() and rgba() functions
--     hsl_fn   = true;        -- CSS hsl() and hsla() functions
--     css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
--     css_fn   = true;        -- Enable all CSS s
--     mode     = 'foreground'; -- Set the display mode.
--     }
-- }

require('colorizer').setup(nil, {
  RGB      = true,
	RRGGBB   = true,
	names    = true,
	RRGGBBAA = true,
	rgb_fn   = true,
	hsl_fn   = true,
	css      = true,
	css_fn   = true,
	mode     = 'background'
})