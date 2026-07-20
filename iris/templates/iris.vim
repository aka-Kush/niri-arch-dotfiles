set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "iris"

hi Normal guibg={bg} guifg={fg}
hi NormalFloat guibg={surface} guifg={fg}
hi FloatBorder guibg={surface} guifg={dim}
hi SignColumn guibg={bg} guifg={fg}
hi LineNr guibg={bg} guifg={dim}
hi CursorLineNr guibg={bg} guifg={accent}
hi CursorLine guibg={surface}
hi ColorColumn guibg={surface}
hi VertSplit guibg={bg} guifg={surface}
hi WinSeparator guibg={bg} guifg={surface}

hi Comment guibg=NONE guifg={syntax_comment} gui=italic
hi Delimiter guibg=NONE guifg={fg}
hi Operator guibg=NONE guifg={syntax_operator}
hi Todo guibg=NONE guifg={yellow} gui=bold

hi Identifier guibg=NONE guifg={syntax_param}
hi Constant guibg=NONE guifg={syntax_const}
hi Type guibg=NONE guifg={syntax_type}
hi String guibg=NONE guifg={syntax_string}
hi Special guibg=NONE guifg={color6}
hi PreProc guibg=NONE guifg={syntax_keyword}
hi Function guibg=NONE guifg={syntax_func}
hi Statement guibg=NONE guifg={syntax_keyword}

hi Error guibg={red} guifg={bg}
hi WarningMsg guibg=NONE guifg={yellow}
hi ErrorMsg guibg=NONE guifg={red}

hi StatusLine guibg={accent} guifg={bg}
hi StatusLineNC guibg={surface} guifg={dim}
hi TabLine guibg={surface} guifg={dim}
hi TabLineSel guibg={accent} guifg={bg}
hi TabLineFill guibg={bg} guifg={bg}

hi Visual guibg={surface}
hi Search guibg={yellow} guifg={bg}
hi IncSearch guibg={accent} guifg={bg}
hi MatchParen guibg={surface} guifg={accent} gui=bold

hi Pmenu guibg={surface} guifg={fg}
hi PmenuSel guibg={accent} guifg={bg}
hi PmenuSbar guibg={surface}
hi PmenuThumb guibg={dim}

hi DiagnosticError guibg=NONE guifg={red}
hi DiagnosticWarn guibg=NONE guifg={yellow}
hi DiagnosticInfo guibg=NONE guifg={accent}
hi DiagnosticHint guibg=NONE guifg={green}
