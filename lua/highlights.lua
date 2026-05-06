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
  -- Base syntax
  --------------------------------------------------------------------
  set(0, "Comment", { fg = C.gray, italic = true })

  set(0, "@number",   { fg = C.gold })
  set(0, "@float",    { fg = C.gold })
  set(0, "@type",     { fg = C.violet })
  set(0, "@variable", { fg = C.cyan })
  set(0, "@field",    { fg = C.cyan })
  set(0, "@string",   { fg = C.pink })
  set(0, "@constant", { fg = C.ember })

  --------------------------------------------------------------------
  -- ULTRA+ – Galaxy Brackets (static)
  --------------------------------------------------------------------

  -- () – funkcje
  set(0, "CosmicParenRound",  { fg = C.gold,  bold = true })
  -- [] – tablice
  set(0, "CosmicParenSquare", { fg = C.cyan,  bold = true })
  -- {} – bloki (bazowy kolor)
  set(0, "CosmicParenCurly",  { fg = C.teal,  bold = true })

  -- RainbowDelimiters – gradient bazowy
  set(0, "RainbowDelimiterRed",     { fg = C.gold })
  set(0, "RainbowDelimiterYellow",  { fg = C.teal })
  set(0, "RainbowDelimiterBlue",    { fg = C.violet })
  set(0, "RainbowDelimiterOrange",  { fg = C.green })
  set(0, "RainbowDelimiterGreen",   { fg = C.pink })
  set(0, "RainbowDelimiterCyan",    { fg = C.ember })
  set(0, "RainbowDelimiterViolet",  { fg = C.cyan })

  --------------------------------------------------------------------
  -- ULTRA+ – Pointer flow
  --------------------------------------------------------------------
  set(0, "@punctuation.delimiter", { fg = C.teal })    -- np. ::
  set(0, "@punctuation.special",   { fg = C.violet })  -- np. =>
  set(0, "@punctuation.accessor",  { fg = C.green })   -- np. .
  set(0, "@operator",              { fg = C.gold })    -- np. ->

  set(0, "GalaxyOperatorGlow", {
    fg = C.teal,
    bold = true,
  })

  set(0, "@punctuation.bracket.call", {
    fg = C.gold,
    bold = true,
    standout = true,
  })

  --------------------------------------------------------------------
  -- ULTRA++ – per‑bracket gradient ({} / () / [])
  -- Zakładamy, że RainbowDelimiters używa różnych grup dla typów nawiasów
  --------------------------------------------------------------------

  -- Curly {} – scope / blok
  set(0, "CosmicCurlyLevel1", { fg = C.teal })
  set(0, "CosmicCurlyLevel2", { fg = C.cyan })
  set(0, "CosmicCurlyLevel3", { fg = C.violet })
  set(0, "CosmicCurlyLevel4", { fg = C.pink })

  -- Round () – wywołania / wyrażenia
  set(0, "CosmicRoundLevel1", { fg = C.gold })
  set(0, "CosmicRoundLevel2", { fg = C.ember })
  set(0, "CosmicRoundLevel3", { fg = C.green })

  -- Square [] – indeksy / tablice
  set(0, "CosmicSquareLevel1", { fg = C.cyan })
  set(0, "CosmicSquareLevel2", { fg = C.teal })
  set(0, "CosmicSquareLevel3", { fg = C.violet })

  --------------------------------------------------------------------
  -- ULTRA++ – Scope glow (bloki {})
  --------------------------------------------------------------------

  -- Ogólny „scope” – tło delikatnie rozjaśnione
  set(0, "CosmicScopeBlock", {
    bg = C.bg_scope or "#181825",
  })

  -- Aktywny scope (np. z pluginu, który podbija tę grupę)
  set(0, "CosmicScopeActive", {
    bg = C.bg_scope_active or "#1e1e2e",
    bold = true,
  })

  --------------------------------------------------------------------
  -- ULTRA++ – Active line + flow
  --------------------------------------------------------------------
  set(0, "CosmicActiveLine", {
    bg = C.bg_active or "#11111b",
  })

  -- Możesz potem powiązać to z CursorLine:
  -- set(0, "CursorLine", { link = "CosmicActiveLine" })

end

return M

