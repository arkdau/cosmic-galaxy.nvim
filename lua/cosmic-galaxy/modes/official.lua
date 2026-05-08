local M = {}

function M.apply(C, set)
  apply_ultra_plus(C, set)
  apply_ultra_plus_2(C, set)
  apply_ultra_plus_3(C, set)
  apply_ultra_plus_4(C, set)
  apply_ultra_plus_5(C, set)

  apply_ufo_heatmap(C, set)
  apply_navic_glow(C, set)
  apply_noice_semantics(C, set)
end

return M

