-- [[ Configure wilder.nvim ]]

local wilder = require('wilder')
wilder.setup({modes = {':', '/', '?'}})

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlighter = wilder.basic_highlighter(),
    border = 'double',
    min_width = '100%', -- minimum height of the popupmenu, can also be a number
    min_height = '20%',
    max_height = '20%',
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
    reverse = 0,        -- if 1, shows the candidates from bottom to top
  })
))
