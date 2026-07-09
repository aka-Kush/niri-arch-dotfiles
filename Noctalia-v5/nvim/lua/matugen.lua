 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#161217',
    base01 = '#221e24',
    base02 = '#2d282e',
    base03 = '#978e98',
    base04 = '#cec3ce',
    base05 = '#e9e0e7',
    base06 = '#e9e0e7',
    base07 = '#e9e0e7',
    base08 = '#ffb4ab',
    base09 = '#f4b7b8',
    base0A = '#d3c0d8',
    base0B = '#e1b7f5',
    base0C = '#f4b7b8',
    base0D = '#e1b7f5',
    base0E = '#d3c0d8',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e9e0e7',          bg = '#161217' })
  hi('TelescopeBorder',         { fg = '#978e98',             bg = '#161217' })
  hi('TelescopePromptNormal',   { fg = '#e9e0e7',          bg = '#161217' })
  hi('TelescopePromptBorder',   { fg = '#978e98',             bg = '#161217' })
  hi('TelescopePromptPrefix',   { fg = '#e1b7f5',             bg = '#161217' })
  hi('TelescopePromptCounter',  { fg = '#cec3ce',  bg = '#161217' })
  hi('TelescopePromptTitle',    { fg = '#161217',             bg = '#e1b7f5' })
  hi('TelescopePreviewTitle',   { fg = '#161217',             bg = '#d3c0d8' })
  hi('TelescopeResultsTitle',   { fg = '#161217',             bg = '#f4b7b8' })
  hi('TelescopeSelection',      { fg = '#e9e0e7',          bg = '#2d282e' })
  hi('TelescopeSelectionCaret', { fg = '#e1b7f5',             bg = '#2d282e' })
  hi('TelescopeMatching',       { fg = '#e1b7f5',             bold = true })
end

 -- Register a signal handler for SIGUSR1 (matugen updates)
 local signal = vim.uv.new_signal()
 signal:start(
   'sigusr1',
   vim.schedule_wrap(function()
     package.loaded['matugen'] = nil
     require('matugen').setup()
   end)
 )

 return M
