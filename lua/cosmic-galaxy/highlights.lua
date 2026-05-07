return {
  apply = function(C)
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

    --------------------------------------------------------------------
    -- ULTRA+++ — Semantic Operators + Flow Heatmap
    --------------------------------------------------------------------
    local function apply_ultra_plus_plus_plus(C, set)
       ------------------------------------------------------------------
       -- 1. Semantic Operators (różne kolory dla różnych typów)
       ------------------------------------------------------------------

       -- logiczne: && || !
       set(0, "CosmicOpLogic", {
         fg = C.violet,
         bold = true,
       })

       -- porównania: == != <= >= < >
       set(0, "CosmicOpCompare", {
         fg = C.gold,
         bold = true,
       })

       -- arytmetyczne: + - * / %
       set(0, "CosmicOpMath", {
         fg = C.ember,
         bold = true,
       })

       -- przypisania: = += -= *= /= %=
       set(0, "CosmicOpAssign", {
         fg = C.green,
         bold = true,
       })

       -- przepływ: -> => ::
       set(0, "CosmicOpFlow", {
         fg = C.teal,
         bold = true,
         standout = true,
       })

       ------------------------------------------------------------------
       -- 2. Flow Heatmap (gradient przepływu kodu)
       ------------------------------------------------------------------

       -- niski poziom przepływu (np. zwykłe wywołania)
       set(0, "CosmicFlowLow", {
         fg = C.cyan,
       })

       -- średni poziom (np. chain calls: a.b().c().d())
       set(0, "CosmicFlowMid", {
         fg = C.teal,
         bold = true,
       })

       -- wysoki poziom (np. pipelines, lambdy, match)
       set(0, "CosmicFlowHigh", {
         fg = C.violet,
         bold = true,
         standout = true,
       })

       ------------------------------------------------------------------
       -- 3. Semantic Treesitter Groups
       ------------------------------------------------------------------

       -- call chains: foo().bar().baz()
       set(0, "@function.call.chain", {
         link = "CosmicFlowMid",
       })

       -- pipelines: |> >> -> =>
       set(0, "@operator.pipeline", {
         link = "CosmicFlowHigh",
       })

       -- lambdy: (x) => x + 1
       set(0, "@function.lambda", {
         fg = C.pink,
         bold = true,
       })

       -- match / switch
       set(0, "@keyword.match", {
         fg = C.violet,
         bold = true,
       })

       -- loops
       set(0, "@keyword.repeat", {
         fg = C.gold,
         bold = true,
       })

       -- return flow
       set(0, "@keyword.return", {
         fg = C.teal,
         bold = true,
       })

       ------------------------------------------------------------------
       -- 4. Dynamic punctuation accents
       ------------------------------------------------------------------

       set(0, "@punctuation.delimiter.flow", {
         link = "CosmicOpFlow",
       })

       set(0, "@punctuation.delimiter.logic", {
         link = "CosmicOpLogic",
       })

       set(0, "@punctuation.delimiter.math", {
         link = "CosmicOpMath",
       })

       set(0, "@punctuation.delimiter.compare", {
         link = "CosmicOpCompare",
       })

       ------------------------------------------------------------------
       -- 5. Heatmap dla call depth (głębokie wywołania)
       ------------------------------------------------------------------

       set(0, "CosmicCallDepth1", { fg = C.cyan })
       set(0, "CosmicCallDepth2", { fg = C.teal })
       set(0, "CosmicCallDepth3", { fg = C.violet })
       set(0, "CosmicCallDepth4", { fg = C.pink })
    end
    --------------------------------------------------------------------
    -- ULTRA++++ — Semantic Flow Engine
    --------------------------------------------------------------------
    local function apply_ultra_plus_4(C, set)

      ------------------------------------------------------------------
      -- 1. Semantic Flow Zones (kolorowanie wg roli w przepływie)
      ------------------------------------------------------------------

      set(0, "CosmicFlowZoneEntry", {
        fg = C.green,
        bold = true,
      })

      set(0, "CosmicFlowZoneProcess", {
        fg = C.teal,
      })

      set(0, "CosmicFlowZoneExit", {
        fg = C.violet,
        bold = true,
        standout = true,
      })

      ------------------------------------------------------------------
      -- 2. Execution Path Glow (podświetlanie ścieżki wykonania)
      ------------------------------------------------------------------

      set(0, "CosmicExecPrimary", {
        fg = C.gold,
        bold = true,
      })

      set(0, "CosmicExecSecondary", {
        fg = C.ember,
      })

      set(0, "CosmicExecTertiary", {
        fg = C.pink,
      })

      ------------------------------------------------------------------
      -- 3. Contextual Block Heat (ciepło semantyczne bloków)
      ------------------------------------------------------------------

      set(0, "CosmicBlockCold", {
        bg = C.bg_scope or "#181825",
      })

      set(0, "CosmicBlockWarm", {
        bg = C.bg_scope_active or "#1e1e2e",
        bold = true,
      })

      set(0, "CosmicBlockHot", {
        bg = "#2a1f3d",
        bold = true,
        standout = true,
      })

      ------------------------------------------------------------------
      -- 4. Operator Intent Mapping (kolorowanie wg intencji)
      ------------------------------------------------------------------

      -- branching: if / else / switch / match
      set(0, "CosmicIntentBranch", {
        fg = C.violet,
        bold = true,
      })

      -- looping: for / while / repeat
      set(0, "CosmicIntentLoop", {
        fg = C.gold,
        bold = true,
      })

      -- functional: |> >> => lambda
      set(0, "CosmicIntentFunctional", {
        fg = C.teal,
        bold = true,
      })

      -- mutation: = += -=
      set(0, "CosmicIntentMutation", {
        fg = C.green,
        bold = true,
      })

      ------------------------------------------------------------------
      -- 5. Call‑Chain Depth Radar (głębia wywołań)
      ------------------------------------------------------------------

      set(0, "CosmicDepth1", { fg = C.cyan })
      set(0, "CosmicDepth2", { fg = C.teal })
      set(0, "CosmicDepth3", { fg = C.violet })
      set(0, "CosmicDepth4", { fg = C.pink })
      set(0, "CosmicDepth5", { fg = C.ember })

      ------------------------------------------------------------------
      -- 6. Treesitter semantic groups
      ------------------------------------------------------------------

      -- wejście do przepływu
      set(0, "@keyword.return", { link = "CosmicFlowZoneExit" })
      set(0, "@keyword.break",  { link = "CosmicFlowZoneExit" })
      set(0, "@keyword.continue", { link = "CosmicFlowZoneProcess" })

      -- branching
      set(0, "@conditional", { link = "CosmicIntentBranch" })
      set(0, "@keyword.conditional", { link = "CosmicIntentBranch" })

      -- loops
      set(0, "@repeat", { link = "CosmicIntentLoop" })
      set(0, "@keyword.repeat", { link = "CosmicIntentLoop" })

      -- functional pipelines
      set(0, "@operator.pipeline", { link = "CosmicIntentFunctional" })

      -- mutation
      set(0, "@operator.assignment", { link = "CosmicIntentMutation" })

      ------------------------------------------------------------------
      -- 7. Dynamic punctuation routing
      ------------------------------------------------------------------

      set(0, "@punctuation.delimiter.branch", { link = "CosmicIntentBranch" })
      set(0, "@punctuation.delimiter.loop",   { link = "CosmicIntentLoop" })
      set(0, "@punctuation.delimiter.flow",   { link = "CosmicFlowZoneProcess" })
    end
    --------------------------------------------------------------------
    -- ULTRA+++++ — Pointer & Memory Flow + Complexity Glow
    --------------------------------------------------------------------
    local function apply_ultra_plus_5(C, set)
      ------------------------------------------------------------------
      -- 1. Pointer Flow (wskaźniki, dereferencje, adresy)
      ------------------------------------------------------------------
      set(0, "CosmicPtrOperator", {
        fg = C.teal,
        bold = true,
      })

      set(0, "CosmicPtrAddress", {
        fg = C.cyan,
      })

      set(0, "CosmicPtrDeref", {
        fg = C.violet,
        bold = true,
      })

      -- Treesitter (C, C++, Rust, itp.)
      set(0, "@operator.pointer", { link = "CosmicPtrOperator" })
      set(0, "@operator.address", { link = "CosmicPtrAddress" })
      set(0, "@operator.dereference", { link = "CosmicPtrDeref" })

      ------------------------------------------------------------------
      -- 2. Memory Flow (alokacja, dealokacja, zarządzanie pamięcią)
      ------------------------------------------------------------------
      set(0, "CosmicMemAlloc", {
        fg = C.green,
        bold = true,
      })

      set(0, "CosmicMemFree", {
        fg = C.ember,
        bold = true,
      })

      set(0, "CosmicMemLeakRisk", {
        fg = C.pink,
        bold = true,
        standout = true,
      })

      -- Przykładowe mapowanie (C / C++ / Rust / Zig)
      set(0, "@function.builtin.memory.alloc", { link = "CosmicMemAlloc" })
      set(0, "@function.builtin.memory.free",  { link = "CosmicMemFree" })

      ------------------------------------------------------------------
      -- 3. Complexity Glow (złożoność fragmentu kodu)
      ------------------------------------------------------------------
      set(0, "CosmicComplexityLow", {
        fg = C.cyan,
      })

      set(0, "CosmicComplexityMid", {
        fg = C.teal,
        bold = true,
      })

      set(0, "CosmicComplexityHigh", {
        fg = C.violet,
        bold = true,
        standout = true,
      })

      ------------------------------------------------------------------
      -- 4. Semantic hints (pętle, zagnieżdżenia, warunki)
      ------------------------------------------------------------------
      set(0, "@complexity.low",  { link = "CosmicComplexityLow" })
      set(0, "@complexity.mid",  { link = "CosmicComplexityMid" })
      set(0, "@complexity.high", { link = "CosmicComplexityHigh" })
    end
    --------------------------------------------------------------------
    -- ULTRA+++++ — nvim-ufo Folding Heatmap
    --------------------------------------------------------------------
    local function apply_ufo_heatmap(C, set)
      -- poziomy foldów
      set(0, "UfoFoldedFg", { fg = C.cyan })
      set(0, "UfoFoldedFg2", { fg = C.teal })
      set(0, "UfoFoldedFg3", { fg = C.violet })
      set(0, "UfoFoldedFg4", { fg = C.pink })

      -- tło foldów
      set(0, "UfoFoldedBg", { bg = "#1a1a24" })
      set(0, "UfoFoldedBgActive", { bg = "#222233", bold = true })

      -- ikonki foldów
      set(0, "UfoFoldedEllipsis", { fg = C.gold, bold = true })
      set(0, "UfoFoldedCount", { fg = C.ember })
    end
    --------------------------------------------------------------------
    -- ULTRA+++++ — nvim-navic Breadcrumb Glow
    --------------------------------------------------------------------
    local function apply_navic_glow(C, set)
      -- ogólne
      set(0, "NavicText", { fg = C.cyan })
      set(0, "NavicSeparator", { fg = C.gray })

      -- semantyczne elementy
      set(0, "NavicIconsFile",        { fg = C.gold })
      set(0, "NavicIconsModule",      { fg = C.teal })
      set(0, "NavicIconsNamespace",   { fg = C.violet })
      set(0, "NavicIconsPackage",     { fg = C.green })
      set(0, "NavicIconsClass",       { fg = C.pink })
      set(0, "NavicIconsMethod",      { fg = C.teal, bold = true })
      set(0, "NavicIconsFunction",    { fg = C.teal })
      set(0, "NavicIconsProperty",    { fg = C.cyan })
      set(0, "NavicIconsField",       { fg = C.cyan })
      set(0, "NavicIconsConstructor", { fg = C.ember })
      set(0, "NavicIconsEnum",        { fg = C.violet })
      set(0, "NavicIconsInterface",   { fg = C.green })
      set(0, "NavicIconsVariable",    { fg = C.cyan })
      set(0, "NavicIconsConstant",    { fg = C.gold })
      set(0, "NavicIconsString",      { fg = C.pink })
      set(0, "NavicIconsNumber",      { fg = C.gold })
      set(0, "NavicIconsBoolean",     { fg = C.violet })
      set(0, "NavicIconsArray",       { fg = C.teal })
      set(0, "NavicIconsObject",      { fg = C.green })
      set(0, "NavicIconsKey",         { fg = C.ember })
      set(0, "NavicIconsNull",        { fg = C.gray })
      set(0, "NavicIconsEnumMember",  { fg = C.violet })
      set(0, "NavicIconsStruct",      { fg = C.green })
      set(0, "NavicIconsEvent",       { fg = C.pink })
      set(0, "NavicIconsOperator",    { fg = C.teal })
      set(0, "NavicIconsTypeParameter", { fg = C.cyan })
    end
    --------------------------------------------------------------------
    -- ULTRA+++++ — noice.nvim Semantic Messages
    --------------------------------------------------------------------
    local function apply_noice_semantics(C, set)
      -- podstawowe komunikaty
      set(0, "NoiceError",   { fg = C.pink, bold = true })
      set(0, "NoiceWarn",    { fg = C.ember, bold = true })
      set(0, "NoiceInfo",    { fg = C.teal })
      set(0, "NoiceDebug",   { fg = C.gray })
      set(0, "NoiceTrace",   { fg = C.violet })

      -- LSP
      set(0, "NoiceLspProgressTitle", { fg = C.gold, bold = true })
      set(0, "NoiceLspProgressClient", { fg = C.teal })
      set(0, "NoiceLspProgressSpinner", { fg = C.violet, bold = true })

      -- popupy
      set(0, "NoicePopupBorder", { fg = C.teal })
      set(0, "NoicePopup", { bg = "NONE" })
    end

    apply_ultra_plus_plus_plus(C, set)
    apply_ultra_plus_4(C, set)
    apply_ultra_plus_5(C, set)      -- ULTRA+++++
    apply_ufo_heatmap(C, set)       -- folding heatmap
    apply_navic_glow(C, set)        -- breadcrumb glow
    apply_noice_semantics(C, set)   -- semantic messages
  end
}

