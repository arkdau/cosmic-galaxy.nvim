local M = {}

-- Dostępne tryby
local modes = {
	default = {},
	embedded = require("cosmic-galaxy.modes.embedded").overrides,
}

-- główna funkcja pluginu
function M.setup(opts)
	opts = opts or {}
	local mode = opts.mode or "default"

	-- wybór palety (domyślnie cosmic_nvim)
	local palette_name = opts.palette or "cosmic_nvim"

	local ok, palette = pcall(require, "cosmic-galaxy.palettes." .. palette_name)
	if not ok then
		vim.notify("cosmic-galaxy.nvim: palette '" .. palette_name .. "' not found", vim.log.levels.ERROR)
		return
	end

	-- załaduj highlighty ULTRA++
	require("cosmic-galaxy.highlights").apply(palette)

	-- Zastosuj tryb (embedded nadpisuje highlighty)
	local overrides = modes[mode] or {}
	for group, spec in pairs(overrides) do
		vim.api.nvim_set_hl(0, group, spec)
	end
	
	-- Load STM32 Treesitter queries
    pcall(function()
      local query_path = vim.fn.stdpath("data")
        .. "/lazy/cosmic-galaxy.nvim/queries/c/cosmic-stm32.scm"

      if vim.fn.filereadable(query_path) == 1 then
        local content = table.concat(vim.fn.readfile(query_path), "\n")
        vim.treesitter.query.set("c", "cosmic_stm32", content)
      end
    end)
end

-- tryb experimental / official
--local config = require("cosmic-galaxy.config")

--function M.apply(C, set)
--  if config.experimental then
--    require("cosmic-galaxy.modes.experimental").apply(C, set)
--  else
--    require("cosmic-galaxy.modes.official").apply(C, set)
--  end
--end
--

return M
