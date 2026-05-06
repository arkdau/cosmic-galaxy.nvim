local M = {}

-- główna funkcja pluginu
function M.setup(opts)
  opts = opts or {}

  -- wybór palety (domyślnie cosmic_nvim)
  local palette_name = opts.palette or "cosmic_nvim"

  local ok, palette = pcall(require, "cosmic-galaxy.palettes." .. palette_name)
  if not ok then
    vim.notify("cosmic-galaxy.nvim: palette '" .. palette_name .. "' not found", vim.log.levels.ERROR)
    return
  end

  -- załaduj highlighty ULTRA++
  require("cosmic-galaxy.highlights").apply(palette)
end

return M

