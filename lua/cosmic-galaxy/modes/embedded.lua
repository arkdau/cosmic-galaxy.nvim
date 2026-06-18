-- lua/cosmic-galaxy/modes/embedded.lua

local M = {}

-- Kolory STM32 (nadpisania)
M.overrides = {
  -- ============================
  --  PERYFERIA (GPIOA, RCC, TIM)
  -- ============================
  ["@stm32.peripheral"] = {
    fg = "#ffcc66",  -- złoty
    bold = true,
  },

  -- ============================
  --  REJESTRY (CRL, APB2ENR, CNT)
  -- ============================
  ["@stm32.register"] = {
    fg = "#ff9966",  -- pomarańczowy
  },

  -- ============================
  --  TYPY CMSIS (GPIO_TypeDef)
  -- ============================
  ["@stm32.type"] = {
    fg = "#66d9ef",  -- cyan
    italic = true,
  },

  -- ============================
  --  BITFIELDY (GPIO_CRH_MODE9)
  -- ============================
  ["@stm32.bitfield"] = {
    fg = "#ff6699",  -- różowy
  },
  
  -- TEST: widoczne tylko w trybie embedded
  ["@embedded.test"] = { fg = "#ff00ff", bold = true },
  
  ["@stm32.isr"] = { fg = "#ff5577", bold = true },
  ["@stm32.isr.reg"] = { fg = "#ffaa77" },
  
  -- MMIO
  ["@stm32.mmio.deref"] = { fg = "#ffcc66", bold = true },
  ["@stm32.mmio.address"] = { fg = "#66d9ef" },
  ["@stm32.mmio.volatile"] = { fg = "#ff6699", italic = true },


}

return M
