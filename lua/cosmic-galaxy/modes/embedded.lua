-- lua/cosmic-galaxy/modes/embedded.lua

local M = {}

-- Nadpisania pod tryb "embedded" / STM32
M.overrides = {
	-- Peryferia (GPIOA, RCC, TIM2, USART1)
	["@stm32.peripheral"] = { fg = "#ffcc66", bold = true },

	-- Rejestry (CRL, CRH, APB2ENR, BRR, CNT)
	["@stm32.register"] = { fg = "#ff9966" },

	-- Typy CMSIS (GPIO_TypeDef, RCC_TypeDef)
	["@stm32.type"] = { fg = "#66d9ef", italic = true },

	-- Bitfieldy (GPIO_CRH_MODE9, RCC_APB2ENR_IOPAEN)
	["@stm32.bitfield"] = { fg = "#ff6699" },
}

return M
