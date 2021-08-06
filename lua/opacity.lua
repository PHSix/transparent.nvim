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
  black = "#262626"
}

local opacity = {
  {"ColorColumn", fg = colors.green, bg = NONE},
  {"Conceal", fg = colors.cool_gray, bg = NONE},
  {"Cursor", fg = colors.black, bg = colors.blue_gray},
  {"lCursor", fg = colors.black, bg = colors.blue_gray},
  {"CursorIM", fg = colors.black, bg = colors.blue_gray},
  {"CursorColumn", bg = NONE},
  {"CursorLine", bg = NONE},
  {"Directory", fg = colors.cyan, bg = NONE},
  {"DiffAdd", fg = colors.teal, bg = NONE},
  {"DiffChange", fg = colors.cyan, bg = NONE},
  {"DiffDelete", fg = colors.red, bg = NONE},
  {"DiffText", fg = colors.amber},
  {"EndOfBuffer", fg = colors.warn_gray},
  {"ErrorMsg", fg = colors.white, bg = colors.red},
  {"VertSplit", fg = NONE},
  {"Folded", fg = colors.gray},
  {"FoldColumn", fg = colors.gray},
  {"SignColumn", bg = NONE},
  {"IncSearch", bg = colors.emerald},
  {"LineNr", fg = colors.warn_gray},
  {"CursorLineNr", fg = colors.lightblue},
  {"MatchParen", fg = colors.pink},
  {"ModeMsg", fg = colors.fuchsia},
  {"MoreMsg", fg = colors.gray},
  {"NonText", fg = colors.true_gray},
  {"Normal", fg = colors.cyan, bg = NONE},
  {"NormalFloat", fg = colors.cyan, bg = NONE},
  {"Pmenu", fg = colors.white, bg = colors.warn_gray},
  {"PmenuSel", fg = colors.white, bg = colors.blue_gray, gui = gui.bold},
  {"PmenuSbar", bg = colors.true_gray},
  {"PmenuThumb", bg = colors.white},
  {"Question", fg = colors.green},
  {"Search", bg = colors.emerald},
  {"Visual", bg = colors.warn_gray, gui = gui.inverse},
  {"WarningMsg", bg = colors.yellow},
  {"WildMenu", fg = colors.white, bg = colors.warn_gray}
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
  if group.style then
    cmd = cmd .. "gui=" .. group.gui .. ""
  end
  vim.cmd(cmd)
end

local setup = function()
  vim.cmd [[highlight clear]]
  vim.o.background = "dark"
  vim.wo.cursorline = false
  if vim.fn.exists("syntax_on") then
    vim.cmd [[syntax reset]]
  end
  vim.g.colors_name = "opacity"
  for _, v in ipairs(opacity) do
    define_highlight(v)
  end
end

return {
  setup = setup
}
