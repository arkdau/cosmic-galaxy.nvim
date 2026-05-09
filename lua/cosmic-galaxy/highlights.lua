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
    set(0, "CosmicParenRound",  { fg = C.gold,  bold = true }) -- ()
    set(0, "CosmicParenSquare", { fg = C.cyan,  bold = true }) -- []
    set(0, "CosmicParenCurly",  { fg = C.teal,  bold = true }) -- {}

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
    set(0, "@punctuation.delimiter", { fg = C.teal })    -- ::
    set(0, "@punctuation.special",   { fg = C.violet })  -- =>
    set(0, "@punctuation.accessor",  { fg = C.green })   -- .
    set(0, "@operator",              { fg = C.gold })    -- ->

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
    set(0, "CosmicScopeBlock", {
      bg = C.bg_scope or "#181825",
    })

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
      -- 1. Semantic Operators
      set(0, "CosmicOpLogic",   { fg = C.violet, bold = true }) -- && || !
      set(0, "CosmicOpCompare", { fg = C.gold,   bold = true }) -- == != <= >= < >
      set(0, "CosmicOpMath",    { fg = C.ember,  bold = true }) -- + - * / %
      set(0, "CosmicOpAssign",  { fg = C.green,  bold = true }) -- = += -= ...
      set(0, "CosmicOpFlow",    { fg = C.teal,   bold = true, standout = true }) -- -> => ::

      -- 2. Flow Heatmap
      set(0, "CosmicFlowLow",  { fg = C.cyan })
      set(0, "CosmicFlowMid",  { fg = C.teal,   bold = true })
      set(0, "CosmicFlowHigh", { fg = C.violet, bold = true, standout = true })

      -- 3. Treesitter semantic groups
      set(0, "@function.call.chain", { link = "CosmicFlowMid" })
      set(0, "@operator.pipeline",   { link = "CosmicFlowHigh" })
      set(0, "@function.lambda",     { fg = C.pink, bold = true })
      set(0, "@keyword.match",       { fg = C.violet, bold = true })
      set(0, "@keyword.repeat",      { fg = C.gold, bold = true })
      set(0, "@keyword.return",      { fg = C.teal, bold = true })

      -- 4. Dynamic punctuation accents
      set(0, "@punctuation.delimiter.flow",    { link = "CosmicOpFlow" })
      set(0, "@punctuation.delimiter.logic",   { link = "CosmicOpLogic" })
      set(0, "@punctuation.delimiter.math",    { link = "CosmicOpMath" })
      set(0, "@punctuation.delimiter.compare", { link = "CosmicOpCompare" })

      -- 5. Call depth
      set(0, "CosmicCallDepth1", { fg = C.cyan })
      set(0, "CosmicCallDepth2", { fg = C.teal })
      set(0, "CosmicCallDepth3", { fg = C.violet })
      set(0, "CosmicCallDepth4", { fg = C.pink })
    end

    --------------------------------------------------------------------
    -- ULTRA++++ — Semantic Flow Engine
    --------------------------------------------------------------------
    local function apply_ultra_plus_4(C, set)
      -- 1. Flow zones
      set(0, "CosmicFlowZoneEntry",   { fg = C.green,  bold = true })
      set(0, "CosmicFlowZoneProcess",{ fg = C.teal })
      set(0, "CosmicFlowZoneExit",   { fg = C.violet, bold = true, standout = true })

      -- 2. Execution path glow
      set(0, "CosmicExecPrimary",   { fg = C.gold,  bold = true })
      set(0, "CosmicExecSecondary", { fg = C.ember })
      set(0, "CosmicExecTertiary",  { fg = C.pink })

      -- 3. Contextual block heat
      set(0, "CosmicBlockCold", { bg = C.bg_scope or "#181825" })
      set(0, "CosmicBlockWarm", { bg = C.bg_scope_active or "#1e1e2e", bold = true })
      set(0, "CosmicBlockHot",  { bg = "#2a1f3d", bold = true, standout = true })

      -- 4. Operator intent
      set(0, "CosmicIntentBranch",     { fg = C.violet, bold = true })
      set(0, "CosmicIntentLoop",       { fg = C.gold,   bold = true })
      set(0, "CosmicIntentFunctional", { fg = C.teal,   bold = true })
      set(0, "CosmicIntentMutation",   { fg = C.green,  bold = true })

      -- 5. Depth radar
      set(0, "CosmicDepth1", { fg = C.cyan })
      set(0, "CosmicDepth2", { fg = C.teal })
      set(0, "CosmicDepth3", { fg = C.violet })
      set(0, "CosmicDepth4", { fg = C.pink })
      set(0, "CosmicDepth5", { fg = C.ember })

      -- 6. Treesitter semantic groups
      set(0, "@keyword.return",   { link = "CosmicFlowZoneExit" })
      set(0, "@keyword.break",    { link = "CosmicFlowZoneExit" })
      set(0, "@keyword.continue", { link = "CosmicFlowZoneProcess" })

      set(0, "@conditional",          { link = "CosmicIntentBranch" })
      set(0, "@keyword.conditional",  { link = "CosmicIntentBranch" })

      set(0, "@repeat",           { link = "CosmicIntentLoop" })
      set(0, "@keyword.repeat",   { link = "CosmicIntentLoop" })

      set(0, "@operator.pipeline",   { link = "CosmicIntentFunctional" })
      set(0, "@operator.assignment", { link = "CosmicIntentMutation" })

      -- 7. Dynamic punctuation routing
      set(0, "@punctuation.delimiter.branch", { link = "CosmicIntentBranch" })
      set(0, "@punctuation.delimiter.loop",   { link = "CosmicIntentLoop" })
      set(0, "@punctuation.delimiter.flow",   { link = "CosmicFlowZoneProcess" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++ — Pointer & Memory Flow + Complexity Glow
    --------------------------------------------------------------------
    local function apply_ultra_plus_5(C, set)
      -- 1. Pointer Flow
      set(0, "CosmicPtrOperator", { fg = C.teal,   bold = true })
      set(0, "CosmicPtrAddress",  { fg = C.cyan })
      set(0, "CosmicPtrDeref",    { fg = C.violet, bold = true })

      set(0, "@operator.pointer",     { link = "CosmicPtrOperator" })
      set(0, "@operator.address",     { link = "CosmicPtrAddress" })
      set(0, "@operator.dereference", { link = "CosmicPtrDeref" })

      -- 2. Memory Flow
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

      set(0, "@function.builtin.memory.alloc", { link = "CosmicMemAlloc" })
      set(0, "@function.builtin.memory.free",  { link = "CosmicMemFree" })

      -- 3. Complexity Glow
      set(0, "CosmicComplexityLow",  { fg = C.cyan })
      set(0, "CosmicComplexityMid",  { fg = C.teal,   bold = true })
      set(0, "CosmicComplexityHigh", { fg = C.violet, bold = true, standout = true })

      set(0, "@complexity.low",  { link = "CosmicComplexityLow" })
      set(0, "@complexity.mid",  { link = "CosmicComplexityMid" })
      set(0, "@complexity.high", { link = "CosmicComplexityHigh" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++ — nvim-ufo Folding Heatmap
    --------------------------------------------------------------------
    local function apply_ufo_heatmap(C, set)
      set(0, "UfoFoldedFg",      { fg = C.cyan })
      set(0, "UfoFoldedFg2",     { fg = C.teal })
      set(0, "UfoFoldedFg3",     { fg = C.violet })
      set(0, "UfoFoldedFg4",     { fg = C.pink })
      set(0, "UfoFoldedBg",      { bg = "#1a1a24" })
      set(0, "UfoFoldedBgActive",{ bg = "#222233", bold = true })
      set(0, "UfoFoldedEllipsis",{ fg = C.gold, bold = true })
      set(0, "UfoFoldedCount",   { fg = C.ember })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++ — nvim-navic Breadcrumb Glow
    --------------------------------------------------------------------
    local function apply_navic_glow(C, set)
      set(0, "NavicText",       { fg = C.cyan })
      set(0, "NavicSeparator",  { fg = C.gray })

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
      set(0, "NavicIconsTypeParameter",{ fg = C.cyan })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++ — noice.nvim Semantic Messages
    --------------------------------------------------------------------
    local function apply_noice_semantics(C, set)
      set(0, "NoiceError",   { fg = C.pink,   bold = true })
      set(0, "NoiceWarn",    { fg = C.ember,  bold = true })
      set(0, "NoiceInfo",    { fg = C.teal })
      set(0, "NoiceDebug",   { fg = C.gray })
      set(0, "NoiceTrace",   { fg = C.violet })

      set(0, "NoiceLspProgressTitle",   { fg = C.gold,  bold = true })
      set(0, "NoiceLspProgressClient",  { fg = C.teal })
      set(0, "NoiceLspProgressSpinner", { fg = C.violet, bold = true })

      set(0, "NoicePopupBorder", { fg = C.teal })
      set(0, "NoicePopup",       { bg = "NONE" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++ — Semantic Context Glow
    --------------------------------------------------------------------
    local function apply_semantic_context_glow(C, set)
      set(0, "CosmicContextFunction", {
        bg = "#1e1e2e",
        fg = C.teal,
        bold = true,
      })

      set(0, "CosmicContextLoop", {
        bg = "#221b2e",
        fg = C.gold,
        bold = true,
      })

      set(0, "CosmicContextConditional", {
        bg = "#2a1f3d",
        fg = C.violet,
        bold = true,
      })

      set(0, "CosmicContextBlock", {
        bg = "#181825",
        fg = C.cyan,
      })

      set(0, "@context.function",    { link = "CosmicContextFunction" })
      set(0, "@context.loop",        { link = "CosmicContextLoop" })
      set(0, "@context.conditional", { link = "CosmicContextConditional" })
      set(0, "@context.block",       { link = "CosmicContextBlock" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++ — Data Flow Heatmap
    --------------------------------------------------------------------
    local function apply_data_flow_heatmap(C, set)
      set(0, "CosmicDataSource",   { fg = C.cyan, bold = true })
      set(0, "CosmicDataTransform",{ fg = C.teal })
      set(0, "CosmicDataSink",     { fg = C.violet, bold = true })

      set(0, "@data.source",    { link = "CosmicDataSource" })
      set(0, "@data.transform", { link = "CosmicDataTransform" })
      set(0, "@data.sink",      { link = "CosmicDataSink" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++ — Pointer Flow Glow
    --------------------------------------------------------------------
    local function apply_pointer_flow_glow(C, set)
      set(0, "CosmicPtrRead",  { fg = C.teal,  bold = true })
      set(0, "CosmicPtrWrite", { fg = C.ember, bold = true })
      set(0, "CosmicPtrAlias", { fg = C.pink })

      set(0, "@pointer.read",  { link = "CosmicPtrRead" })
      set(0, "@pointer.write", { link = "CosmicPtrWrite" })
      set(0, "@pointer.alias", { link = "CosmicPtrAlias" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++ — Memory Flow Glow
    --------------------------------------------------------------------
    local function apply_memory_flow_glow(C, set)
      set(0, "CosmicMemAllocGlow", { fg = C.green, bold = true })
      set(0, "CosmicMemFreeGlow",  { fg = C.ember, bold = true })
      set(0, "CosmicMemRiskGlow",  { fg = C.pink,  bold = true, standout = true })

      set(0, "@memory.alloc", { link = "CosmicMemAllocGlow" })
      set(0, "@memory.free",  { link = "CosmicMemFreeGlow" })
      set(0, "@memory.risk",  { link = "CosmicMemRiskGlow" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++ — Execution Path Tracing
    --------------------------------------------------------------------
    local function apply_execution_path_tracing(C, set)
      set(0, "CosmicExecPathPrimary",   { fg = C.gold,  bold = true, standout = true })
      set(0, "CosmicExecPathSecondary", { fg = C.ember, bold = true })
      set(0, "CosmicExecPathTertiary",  { fg = C.pink })

      set(0, "@exec.primary",   { link = "CosmicExecPathPrimary" })
      set(0, "@exec.secondary", { link = "CosmicExecPathSecondary" })
      set(0, "@exec.tertiary",  { link = "CosmicExecPathTertiary" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++ — Hot Path Glow
    --------------------------------------------------------------------
    local function apply_hot_path_glow(C, set)
      set(0, "CosmicHotPath",  { fg = C.violet, bold = true, standout = true })
      set(0, "CosmicWarmPath", { fg = C.teal,   bold = true })
      set(0, "CosmicColdPath", { fg = C.cyan })

      set(0, "@path.hot",  { link = "CosmicHotPath" })
      set(0, "@path.warm", { link = "CosmicWarmPath" })
      set(0, "@path.cold", { link = "CosmicColdPath" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++ — Dead Code Fade
    --------------------------------------------------------------------
    local function apply_dead_code_fade(C, set)
      set(0, "CosmicDeadCode", { fg = C.gray, italic = true })
      set(0, "@code.dead",     { link = "CosmicDeadCode" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++ — Escape Analysis Glow
    --------------------------------------------------------------------
    local function apply_escape_analysis(C, set)
      set(0, "CosmicEscapeSafe", { fg = C.green, bold = true })
      set(0, "CosmicEscapeLeak", { fg = C.pink,  bold = true, standout = true })

      set(0, "@escape.safe", { link = "CosmicEscapeSafe" })
      set(0, "@escape.leak", { link = "CosmicEscapeLeak" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++ — Alias Tracking
    --------------------------------------------------------------------
    local function apply_alias_tracking(C, set)
      set(0, "CosmicAliasPrimary",   { fg = C.teal,  bold = true })
      set(0, "CosmicAliasSecondary", { fg = C.cyan })
      set(0, "CosmicAliasConflict",  { fg = C.ember, bold = true })

      set(0, "@alias.primary",   { link = "CosmicAliasPrimary" })
      set(0, "@alias.secondary", { link = "CosmicAliasSecondary" })
      set(0, "@alias.conflict",  { link = "CosmicAliasConflict" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++ — Lifetime Zones
    --------------------------------------------------------------------
    local function apply_lifetime_zones(C, set)
      set(0, "CosmicLifetimeStack",  { fg = C.teal })
      set(0, "CosmicLifetimeHeap",   { fg = C.violet, bold = true })
      set(0, "CosmicLifetimeGlobal", { fg = C.gold,   bold = true })

      set(0, "@lifetime.stack",  { link = "CosmicLifetimeStack" })
      set(0, "@lifetime.heap",   { link = "CosmicLifetimeHeap" })
      set(0, "@lifetime.global", { link = "CosmicLifetimeGlobal" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++++ — Branch Prediction Glow
    --------------------------------------------------------------------
    local function apply_branch_prediction_glow(C, set)
      set(0, "CosmicBranchLikely",    { fg = C.teal, bold = true })
      set(0, "CosmicBranchUnlikely",  { fg = C.gray, italic = true })
      set(0, "CosmicBranchMispredict",{ fg = C.pink, bold = true, standout = true })

      set(0, "@branch.likely",     { link = "CosmicBranchLikely" })
      set(0, "@branch.unlikely",   { link = "CosmicBranchUnlikely" })
      set(0, "@branch.mispredict", { link = "CosmicBranchMispredict" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++++ — Cache Flow Heatmap
    --------------------------------------------------------------------
    local function apply_cache_flow_heatmap(C, set)
      set(0, "CosmicCacheL1",  { fg = C.gold,  bold = true })
      set(0, "CosmicCacheL2",  { fg = C.ember })
      set(0, "CosmicCacheL3",  { fg = C.violet })
      set(0, "CosmicCacheRAM", { fg = C.cyan, italic = true })

      set(0, "@cache.l1",  { link = "CosmicCacheL1" })
      set(0, "@cache.l2",  { link = "CosmicCacheL2" })
      set(0, "@cache.l3",  { link = "CosmicCacheL3" })
      set(0, "@cache.ram", { link = "CosmicCacheRAM" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++++ — Register Flow Glow
    --------------------------------------------------------------------
    local function apply_register_flow_glow(C, set)
      set(0, "CosmicRegHot",  { fg = C.teal, bold = true })
      set(0, "CosmicRegWarm", { fg = C.cyan })
      set(0, "CosmicRegCold", { fg = C.gray, italic = true })

      set(0, "@reg.hot",  { link = "CosmicRegHot" })
      set(0, "@reg.warm", { link = "CosmicRegWarm" })
      set(0, "@reg.cold", { link = "CosmicRegCold" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++++ — Semantic Timewarp
    --------------------------------------------------------------------
    local function apply_semantic_timewarp(C, set)
      set(0, "CosmicTimeNew",      { fg = C.green, bold = true })
      set(0, "CosmicTimeModified", { fg = C.teal })
      set(0, "CosmicTimeRemoved",  { fg = C.pink, italic = true })

      set(0, "@time.new",      { link = "CosmicTimeNew" })
      set(0, "@time.modified", { link = "CosmicTimeModified" })
      set(0, "@time.removed",  { link = "CosmicTimeRemoved" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++++ — Micro-Optimization Hints
    --------------------------------------------------------------------
    local function apply_micro_opt_hints(C, set)
      set(0, "CosmicOptInline",    { fg = C.teal,  bold = true })
      set(0, "CosmicOptUnroll",    { fg = C.gold,  bold = true })
      set(0, "CosmicOptVectorize", { fg = C.violet })

      set(0, "@opt.inline",    { link = "CosmicOptInline" })
      set(0, "@opt.unroll",    { link = "CosmicOptUnroll" })
      set(0, "@opt.vectorize", { link = "CosmicOptVectorize" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++++ — Pipeline Flow Glow
    --------------------------------------------------------------------
    local function apply_pipeline_flow_glow(C, set)
      set(0, "CosmicPipeStart", { fg = C.cyan,   bold = true })
      set(0, "CosmicPipeMid",   { fg = C.teal })
      set(0, "CosmicPipeEnd",   { fg = C.violet, bold = true, standout = true })

      set(0, "@pipe.start", { link = "CosmicPipeStart" })
      set(0, "@pipe.mid",   { link = "CosmicPipeMid" })
      set(0, "@pipe.end",   { link = "CosmicPipeEnd" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++++ — Semantic Energy Map
    --------------------------------------------------------------------
    local function apply_semantic_energy_map(C, set)
      set(0, "CosmicEnergyLow",    { fg = C.cyan })
      set(0, "CosmicEnergyMedium", { fg = C.teal,  bold = true })
      set(0, "CosmicEnergyHigh",   { fg = C.ember, bold = true, standout = true })

      set(0, "@energy.low",    { link = "CosmicEnergyLow" })
      set(0, "@energy.medium", { link = "CosmicEnergyMedium" })
      set(0, "@energy.high",   { link = "CosmicEnergyHigh" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++++ — Branch Entropy Glow
    --------------------------------------------------------------------
    local function apply_branch_entropy_glow(C, set)
      set(0, "CosmicEntropyLow",    { fg = C.green })
      set(0, "CosmicEntropyMedium", { fg = C.teal,  bold = true })
      set(0, "CosmicEntropyHigh",   { fg = C.pink,  bold = true, standout = true })

      set(0, "@entropy.low",    { link = "CosmicEntropyLow" })
      set(0, "@entropy.medium", { link = "CosmicEntropyMedium" })
      set(0, "@entropy.high",   { link = "CosmicEntropyHigh" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++++ — Semantic Risk Zones
    --------------------------------------------------------------------
    local function apply_semantic_risk_zones(C, set)
      set(0, "CosmicRiskSafe",    { fg = C.green })
      set(0, "CosmicRiskWarning", { fg = C.gold, bold = true })
      set(0, "CosmicRiskDanger",  { fg = C.pink, bold = true, standout = true })

      set(0, "@risk.safe",    { link = "CosmicRiskSafe" })
      set(0, "@risk.warning", { link = "CosmicRiskWarning" })
      set(0, "@risk.danger",  { link = "CosmicRiskDanger" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++++++ — Semantic Gravity
    --------------------------------------------------------------------
    local function apply_semantic_gravity(C, set)
      set(0, "CosmicGravityWeak",   { fg = C.cyan })
      set(0, "CosmicGravityMedium", { fg = C.teal,   bold = true })
      set(0, "CosmicGravityStrong", { fg = C.violet, bold = true, standout = true })

      set(0, "@gravity.weak",   { link = "CosmicGravityWeak" })
      set(0, "@gravity.medium", { link = "CosmicGravityMedium" })
      set(0, "@gravity.strong", { link = "CosmicGravityStrong" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++++++ — Data Orbit Map
    --------------------------------------------------------------------
    local function apply_data_orbit_map(C, set)
      set(0, "CosmicOrbitInner",  { fg = C.teal, bold = true })
      set(0, "CosmicOrbitMiddle", { fg = C.cyan })
      set(0, "CosmicOrbitOuter",  { fg = C.gray, italic = true })

      set(0, "@orbit.inner",  { link = "CosmicOrbitInner" })
      set(0, "@orbit.middle", { link = "CosmicOrbitMiddle" })
      set(0, "@orbit.outer",  { link = "CosmicOrbitOuter" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++++++ — Pointer Warp Glow
    --------------------------------------------------------------------
    local function apply_pointer_warp_glow(C, set)
      set(0, "CosmicPtrWarpIn",      { fg = C.teal, bold = true })
      set(0, "CosmicPtrWarpOut",     { fg = C.pink, bold = true, standout = true })
      set(0, "CosmicPtrWarpNeutral", { fg = C.cyan })

      set(0, "@ptr.warp.in",      { link = "CosmicPtrWarpIn" })
      set(0, "@ptr.warp.out",     { link = "CosmicPtrWarpOut" })
      set(0, "@ptr.warp.neutral", { link = "CosmicPtrWarpNeutral" })
    end

    --------------------------------------------------------------------
    -- ULTRA++++++++++ — Semantic Black Holes
    --------------------------------------------------------------------
    local function apply_semantic_blackholes(C, set)
      set(0, "CosmicBlackHole",     { fg = C.pink, bold = true, standout = true })
      set(0, "CosmicBlackHoleWeak", { fg = C.gray, italic = true })

      set(0, "@blackhole.strong", { link = "CosmicBlackHole" })
      set(0, "@blackhole.weak",   { link = "CosmicBlackHoleWeak" })
    end

    --------------------------------------------------------------------
    -- ULTRA+++++++++++ — Quantum Layer
    --------------------------------------------------------------------
    local function apply_quantum_layer(C, set)
      -- 1. Quantum Data Superposition
      set(0, "CosmicQuantumSuperposition", {
        fg = C.teal,
        italic = true,
      })
      set(0, "@quantum.superposition", { link = "CosmicQuantumSuperposition" })

      -- 2. Quantum Entanglement Glow
      set(0, "CosmicQuantumEntangledA", {
        fg = C.violet,
        bold = true,
      })
      set(0, "CosmicQuantumEntangledB", {
        fg = C.pink,
        bold = true,
      })
      set(0, "@quantum.entangled.a", { link = "CosmicQuantumEntangledA" })
      set(0, "@quantum.entangled.b", { link = "CosmicQuantumEntangledB" })

      -- 3. Semantic Wormholes
      set(0, "CosmicWormholeEntry", {
        fg = C.cyan,
        bold = true,
      })
      set(0, "CosmicWormholeExit", {
        fg = C.ember,
        bold = true,
        standout = true,
      })
      set(0, "@wormhole.entry", { link = "CosmicWormholeEntry" })
      set(0, "@wormhole.exit",  { link = "CosmicWormholeExit" })

      -- 4. Temporal Causality Map
      set(0, "CosmicCausalityCause", {
        fg = C.gold,
        bold = true,
      })
      set(0, "CosmicCausalityEffect", {
        fg = C.teal,
      })
      set(0, "@causality.cause",  { link = "CosmicCausalityCause" })
      set(0, "@causality.effect", { link = "CosmicCausalityEffect" })
    end

    --------------------------------------------------------------------
    -- Apply all ULTRA layers
    --------------------------------------------------------------------
    apply_ultra_plus_plus_plus(C, set)
    apply_ultra_plus_4(C, set)
    apply_ultra_plus_5(C, set)
    apply_ufo_heatmap(C, set)
    apply_navic_glow(C, set)
    apply_noice_semantics(C, set)
    apply_semantic_context_glow(C, set)
    apply_data_flow_heatmap(C, set)
    apply_pointer_flow_glow(C, set)
    apply_memory_flow_glow(C, set)
    apply_execution_path_tracing(C, set)
    apply_hot_path_glow(C, set)
    apply_dead_code_fade(C, set)
    apply_escape_analysis(C, set)
    apply_alias_tracking(C, set)
    apply_lifetime_zones(C, set)
    apply_branch_prediction_glow(C, set)
    apply_cache_flow_heatmap(C, set)
    apply_register_flow_glow(C, set)
    apply_semantic_timewarp(C, set)
    apply_micro_opt_hints(C, set)
    apply_pipeline_flow_glow(C, set)
    apply_semantic_energy_map(C, set)
    apply_branch_entropy_glow(C, set)
    apply_semantic_risk_zones(C, set)
    apply_semantic_gravity(C, set)
    apply_data_orbit_map(C, set)
    apply_pointer_warp_glow(C, set)
    apply_semantic_blackholes(C, set)
    apply_quantum_layer(C, set)
  end
}
