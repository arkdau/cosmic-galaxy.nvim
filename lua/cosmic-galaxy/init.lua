local M = {}

function M.setup()
  -- Wczytaj paletę (dowolną, np. cosmic_nvim)
  local ok, palette = pcall(require, "cosmic-galaxy.palettes.cosmic_nvim")
  if not ok then
    vim.notify("cosmic-galaxy.nvim: palette not found", vim.log.levels.ERROR)
    return
  end

  -- Załaduj highlighty ULTRA++
  require("cosmic-galaxy.highlights").apply(palette)
end

return M

