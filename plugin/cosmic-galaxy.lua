-- automatyczne ładowanie pluginu, jeśli ktoś nie używa Lazy
if vim.g.loaded_cosmic_galaxy then
  return
end
vim.g.loaded_cosmic_galaxy = true

-- domyślne uruchomienie
require("cosmic-galaxy").setup()

