local NONE = "NONE"
local gui = {
  bold = "bold",
  italic = "italic",
  underline = "underline",
  inverse = "inverse"
}
local colors = {
  red = "#DC2626",
  orange = "#F97316",
  amber = "#F59E0B",
  yellow = "#EAB308",
  lime = "#84CC16",
  green = "#22C55E",
  emerald = "#10B981",
  teal = "#14B8A6",
  cyan = "#06B6D4",
  lightblue = "#0EA5E9",
  blue = "#3B82F6",
  indigo = "#6366F1",
  violet = "#6366F1",
  purple = "#A855F7",
  fuchsia = "#D946EF",
  pink = "#EC4899",
  rose = "#F43F5E",
  warn_gray = "#57534E",
  true_gray = "#737373",
  gray = "#71717A",
  cool_gray = "#6B7280",
  blue_gray = "#64748B",
  white = "#ffffff",
  black = "#262626",
  dark = "#1E293B"
}

local opacity = {
  {"ColorColumn", fg = colors.green, bg = NONE},
  {"Conceal", fg = colors.cool_gray, bg = NONE},
  {"Cursor", fg = colors.black, bg = colors.blue_gray},
  {"lCursor", fg = colors.black, bg = colors.blue_gray},
  {"CursorIM", fg = colors.black, bg = colors.blue_gray},
  {"CursorColumn", bg = NONE},
  {"CursorLine", bg = colors.cool_gray},
  {"Directory", fg = colors.cyan, bg = NONE},
  {"DiffAdd", fg = colors.teal, bg = NONE},
  {"DiffChange", fg = colors.cyan, bg = NONE},
  {"DiffDelete", fg = colors.red, bg = NONE},
  {"DiffText", fg = colors.amber},
  {"EndOfBuffer", fg = colors.warn_gray},
  {"ErrorMsg", fg = colors.white, bg = colors.red},
  {"VertSplit", fg = colors.blue_gray, bg = colors.black},
  {"Folded", fg = colors.gray},
  {"FoldColumn", fg = colors.gray},
  {"SignColumn", bg = NONE},
  {"IncSearch", bg = colors.emerald},
  {"LineNr", fg = colors.warn_gray},
  {"CursorLineNr", fg = colors.lightblue},
  {"MatchParen", fg = colors.pink},
  {"ModeMsg", fg = colors.warn_gray},
  {"MoreMsg", fg = colors.gray},
  {"NonText", fg = colors.true_gray},
  {"Normal", fg = colors.cyan, bg = NONE},
  {"NormalFloat", fg = colors.cyan, bg = NONE},
  {"Pmenu", fg = colors.white, bg = colors.warn_gray},
  {"PmenuSel", fg = colors.white, bg = colors.blue_gray, gui = gui.bold},
  {"PmenuSbar", bg = colors.true_gray},
  {"PmenuThumb", bg = colors.white},
  {"Question", fg = colors.green},
  {"QuickFixLine", fg = colors.green},
  {"Search", bg = colors.emerald},
  {"SpecialKey", fg = colors.white, bg = colors.true_gray},
  {"SpellBad", fg = colors.white, bg = colors.true_gray},
  {"SpellCap", bg = colors.red},
  {"SpellLocal", bg = colors.pink},
  {"SpellRare", bg = colors.pink},
  {"StatusLine", fg = colors.dark},
  {"StatusLineNC", fg = colors.dark},
  {"StatusLineTerm", fg = colors.dark},
  {"StatusLineTermNC", fg = colors.dark},
  {"TabLine", bg = NONE},
  {"TabLineFill", bg = NONE},
  {"TabLineSel", bg = NONE},
  {"Terminal", bg = NONE},
  {"Title", fg = colors.yellow},
  {"Visual", bg = colors.warn_gray, gui = gui.inverse},
  {"WarningMsg", bg = colors.yellow},
  {"WildMenu", fg = colors.white, bg = colors.warn_gray},
  {"Identifier", fg = colors.white},
  {"Keyword", fg = colors.teal, gui = gui.italic},
  {"Type", fg = colors.lightblue, gui = gui.italic},
  {"Character", fg = colors.cyan},
  {"String", fg = colors.green},
  {"Number", fg = colors.orange},
  {"Boolean", fg = colors.emerald},
  {"Float", fg = colors.lightblue},
  {"Function", fg = colors.yellow, gui = gui.bold},
  {"PreProc", fg = colors.emerald},
  {"Statement", fg = colors.amber, gui = NONE},
  {"Comment", fg = colors.gray},
  {"TSBoolean", fg = colors.emerald},
  {"TSCharacter", fg = colors.cyan},
  {"TSComment", fg = colors.gray},
  {"TSConditional", fg = colors.orange},
  {"TSConstant", fg = colors.white},
  {"TSConstBuiltin", fg = colors.white},
  {"TSConstMacro", fg = colors.white},
  {"TSConstructor", fg = colors.indigo},
  {"TSError", fg = colors.red},
  {"TSException", fg = colors.cyan},
  {"TSKeywordException", fg = colors.cyan},
  {"TSKeywordOperator", fg = colors.yellow},
  {"TSKeywordReturn", fg = colors.amber},
  {"TSMethod", fg = colors.yellow, gui = gui.bold},
  {"TSNamespace", fg = colors.gray},
  {"TSNone", fg = colors.warn_gray},
  {"TSNumber", fg = colors.blue},
  {"TSOperactor", fg = colors.orange},
  {"TSParameter", fg = colors.white},
  {"TSParameterReference", fg = colors.white},
  {"TSProperty", fg = colors.cyan}, -- field
  -- TODO: TSPunctDelimiter
  {"TSString", fg = colors.green},
  {"TSStringRegex", fg = colors.green},
  {"TSWarning", bg = colors.orange},
  {"TSDanger", bg = colors.red},
  {"TSVariable", fg = colors.white},
  {"TelescopeSelection", fg = colors.rose, bg = NONE, gui = gui.bold},
  {"TelescopeSelectionCaret", fg = colors.true_gray},
  {"TelescopeMultiSelection", fg = colors.blue, gui = gui.bold},
  {"TelescopeNormal", fg = colors.true_gray},
  {"TelescopeBorder", fg = colors.warn_gray},
  {"TelescopePromptBorder", fg = colors.green},
  {"TelescopePromptPrefix", fg = colors.green},
  {"TelescopeResultsBorder", fg = colors.blue},
  {"TelescopeMatching", fg = colors.emerald},
  {"TelescopePreviewBorder", fg = colors.cyan},
  {"LspDiagnosticsDefaultError", fg = colors.red},
  {"LspDiagnosticsDefaultWarning", fg = colors.yellow},
  {"LspDiagnosticsDefaultInformation", fg = colors.blue_gray},
  {"LspDiagnosticsDefaultHint", fg = colors.gray}
}

-- @param: group{name: string, fg: string, bg:string, style:string}
local function define_highlight(group)
  local cmd = "hi! " .. group[1] .. " "
  if group.fg then
    cmd = cmd .. "guifg=" .. group.fg .. " "
  end
  if group.bg then
    cmd = cmd .. "guibg=" .. group.bg .. " "
  end
  if group.gui then
    cmd = cmd .. "gui=" .. group.gui .. ""
  end
  vim.cmd(cmd)
end

local setup = function()
  vim.cmd [[highlight clear]]
  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.wo.cursorline = false
  vim.cmd [[set fillchars+=vert:\ ]]
  if vim.fn.exists("syntax_on") then
    vim.cmd [[syntax reset]]
  end
  vim.g.colors_name = "opacity"
  for _, v in ipairs(opacity) do
    define_highlight(v)
  end
end

setup()

return {
  setup = setup
}
