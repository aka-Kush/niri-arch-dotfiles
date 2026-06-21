 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#141312',
    base01 = '#211f1e',
    base02 = '#2b2a28',
    base03 = '#998f87',
    base04 = '#d0c4bc',
    base05 = '#e7e1df',
    base06 = '#e7e1df',
    base07 = '#e7e1df',
    base08 = '#ffb4ab',
    base09 = '#c8c7b8',
    base0A = '#cec5be',
    base0B = '#d4c4b7',
    base0C = '#c8c7b8',
    base0D = '#d4c4b7',
    base0E = '#cec5be',
    base0F = '#93000a',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e7e1df',          bg = '#141312' })
  hi('TelescopeBorder',         { fg = '#998f87',             bg = '#141312' })
  hi('TelescopePromptNormal',   { fg = '#e7e1df',          bg = '#141312' })
  hi('TelescopePromptBorder',   { fg = '#998f87',             bg = '#141312' })
  hi('TelescopePromptPrefix',   { fg = '#d4c4b7',             bg = '#141312' })
  hi('TelescopePromptCounter',  { fg = '#d0c4bc',  bg = '#141312' })
  hi('TelescopePromptTitle',    { fg = '#141312',             bg = '#d4c4b7' })
  hi('TelescopePreviewTitle',   { fg = '#141312',             bg = '#cec5be' })
  hi('TelescopeResultsTitle',   { fg = '#141312',             bg = '#c8c7b8' })
  hi('TelescopeSelection',      { fg = '#e7e1df',          bg = '#2b2a28' })
  hi('TelescopeSelectionCaret', { fg = '#d4c4b7',             bg = '#2b2a28' })
  hi('TelescopeMatching',       { fg = '#d4c4b7',             bold = true })
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
