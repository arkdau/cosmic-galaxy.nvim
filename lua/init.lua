local M = {}

local variants = {
  cosmic = "cosmic",
  cosmic_moon = "cosmic_moon",
  cosmic_storm = "cosmic_storm",
  cosmic_dark = "cosmic_dark",
  cosmic_dragon = "cosmic_dragon",
  cosmic_nvim = "cosmic_nvim",
}

function M.load(variant)
  -- wybór wariantu: argument > zmienna globalna > domyślny
  local name = variant or vim.g.cosmic_variant or "cosmic"

  -- jeśli nie ma takiego wariantu, fallback do "cosmic"
  if not variants[name] then
    vim.notify("cosmic: unknown variant '" .. tostring(name) .. "', falling back to 'cosmic'", vim.log.levels.WARN)
    name = "cosmic"
  end

  local ok_palette, palette = pcall(require, "cosmic.palettes." .. variants[name])
  if not ok_palette then
    vim.notify("cosmic: could not load palette '" .. variants[name] .. "', falling back to 'cosmic'", vim.log.levels.ERROR)
    palette = require("cosmic.palettes.cosmic")
  end

  local ok_hl, hl = pcall(require, "cosmic.highlights")
  if not ok_hl then
    vim.notify("cosmic: could not load highlights module", vim.log.levels.ERROR)
    return
  end

  hl.apply(palette)
end

return M



