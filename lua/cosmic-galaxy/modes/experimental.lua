local M = {}

function M.apply(C, set)
  -- oficjalne warstwy też są potrzebne
  require("cosmic-galaxy.modes.official").apply(C, set)

  -- experimental layers
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

return M

