local M = {}

function M.apply(C)
  local set = vim.api.nvim_set_hl

  --------------------------------------------------------------------
  -- UI (transparent)
  --------------------------------------------------------------------
  set(0, "Normal",        { fg = C.fg, bg = "NONE" })
  set(0, "NormalFloat",   { bg = "NONE" })
  set(0, "FloatBorder",   { bg = "NONE" })
  set(0, "SignColumn",    { bg = "NONE" })
  set(0, "LineNr",        { bg = "NONE" })
  set(0, "CursorLine",    { bg = "NONE" })
  set(0, "CursorLineNr",  { bg = "NONE" })
  set(0, "StatusLine",    { bg = "NONE" })
  set(0, "WinSeparator",  { bg = "NONE" })

  --------------------------------------------------------------------
  -- Syntax
  --------------------------------------------------------------------
  set(0, "Comment", { fg = C.gray, italic = true })

  set(0, "@number", { fg = C.gold })
  set(0, "@float",  { fg = C.gold })
  set(0, "@type",   { fg = C.violet })
  set(0, "@variable", { fg = C.cyan })
  set(0, "@field",    { fg = C.cyan })
  set(0, "@string",   { fg = C.pink })
  set(0, "@constant", { fg = C.ember })

  --------------------------------------------------------------------
  -- GALAXY BRACKETS ULTRA+
  --------------------------------------------------------------------

  -- () – funkcje (stały kolor)
  set(0, "CosmicParenRound",  { fg = C.gold, bold = true })

  -- [] – tablice (stały kolor)
  set(0, "CosmicParenSquare", { fg = C.cyan, bold = true })

  --------------------------------------------------------------------
  -- GALAXY GRADIENT FOR {}
  -- 7‑poziomowy neonowy gradient COSMIC
  --------------------------------------------------------------------
  set(0, "RainbowDelimiterRed",     { fg = C.gold })    -- level 1
  set(0, "RainbowDelimiterYellow",  { fg = C.teal })    -- level 2
  set(0, "RainbowDelimiterBlue",    { fg = C.violet })  -- level 3
  set(0, "RainbowDelimiterOrange",  { fg = C.green })   -- level 4
  set(0, "RainbowDelimiterGreen",   { fg = C.pink })    -- level 5
  set(0, "RainbowDelimiterCyan",    { fg = C.ember })   -- level 6
  set(0, "RainbowDelimiterViolet",  { fg = C.cyan })    -- level 7

  --------------------------------------------------------------------
  -- POINTER FLOW ULTRA+
  -- → => :: . ->  — dynamiczne neonowe kolory
  --------------------------------------------------------------------
  set(0, "@punctuation.delimiter", { fg = C.teal })     -- np. ::
  set(0, "@punctuation.special",   { fg = C.violet })   -- np. =>
  set(0, "@punctuation.accessor",  { fg = C.green })    -- np. .
  set(0, "@operator",              { fg = C.gold })     -- np. ->

  --------------------------------------------------------------------
  -- OPERATOR GLOW (delikatny neon)
  --------------------------------------------------------------------
  set(0, "GalaxyOperatorGlow", {
    fg = C.teal,
    bold = true,
  })

  --------------------------------------------------------------------
  -- ZEWNĘTRZNE NAWIASY FUNKCJI (pulsujący efekt)
  --------------------------------------------------------------------
  set(0, "@punctuation.bracket.call", {
    fg = C.gold,
    bold = true,
    standout = true,
  })

end

return M

