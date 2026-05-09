if vim.g.loaded_cosmic_galaxy then
  return
end
vim.g.loaded_cosmic_galaxy = true

-- automatyczne ładowanie highlightów po zmianie colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local ok, galaxy = pcall(require, "cosmic-galaxy")
    if ok then
      local palette = require("cosmic-galaxy.palettes.cosmic_nvim")
      galaxy.apply(palette, vim.api.nvim_set_hl)
    end
  end,
})

-- domyślne uruchomienie
require("cosmic-galaxy").setup()


