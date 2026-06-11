;; ================================
;;  STM32 PERIPHERALS (GPIOA, RCC)
;; ================================

((identifier) @stm32.peripheral
  (#match? @stm32.peripheral "^(GPIO[A-K]|RCC|FLASH|EXTI|AFIO|USART[1-6]|TIM[1-8]|ADC[1-3]|DMA[1-2])$"))

;; ================================
;;  STM32 REGISTERS (CRL, APB2ENR)
;; ================================

((field_identifier) @stm32.register
  (#match? @stm32.register "^(CRL|CRH|IDR|ODR|BSRR|BRR|APB1ENR|APB2ENR|AHBENR|SR|DR|CNT|PSC|ARR|CCR[1-4])$"))

;; ================================
;;  CMSIS TYPES (GPIO_TypeDef)
;; ================================

((type_identifier) @stm32.type
  (#match? @stm32.type ".*_TypeDef$"))

;; ================================
;;  BITFIELDS (GPIO_CRH_MODE9)
;; ================================

((identifier) @stm32.bitfield
  (#match? @stm32.bitfield "^[A-Z0-9_]+_(EN|RST|MODE[0-9]+|CNF[0-9]+)$"))

