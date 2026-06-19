;; ================================
;;  STM32 PERIPHERALS (GPIOA, RCC)
;; ================================
((identifier) @stm32.peripheral
  (#match? @stm32.peripheral
    "^(GPIO[A-K]|RCC|FLASH|EXTI|AFIO|USART[1-6]|TIM[1-8]|ADC[1-3]|DMA[1-2])$"))

;; ================================
;;  STM32 REGISTERS (CRL, APB2ENR)
;; ================================
((field_identifier) @stm32.register
  (#match? @stm32.register
    "^(CRL|CRH|IDR|ODR|BSRR|BRR|APB1ENR|APB2ENR|AHBENR|SR|DR|CNT|PSC|ARR|CCR[1-4])$"))

;; ================================
;;  CMSIS TYPES (GPIO_TypeDef)
;; ================================
((type_identifier) @stm32.type
  (#match? @stm32.type ".*_TypeDef$"))

;; ================================
;;  BITFIELDS (GPIO_CRH_MODE9)
;; ================================
((identifier) @stm32.bitfield
  (#match? @stm32.bitfield
    "^[A-Z0-9_]+_(EN|RST|MODE[0-9]+|CNF[0-9]+|PE|IE|IF)$"))

((identifier) @embedded.test
  (#match? @embedded.test "^__embedded_test_variable$"))

;; ================================
;;  STM32 REGISTER BASE ADDRESSES
;; ================================
((identifier) @stm32.peripheral
  (#match? @stm32.peripheral
    "^(GPIO[A-K]_BASE|RCC_BASE|FLASH_BASE|EXTI_BASE|AFIO_BASE|DMA[1-2]_BASE|USART[1-6]_BASE|TIM[1-8]_BASE)$"))

;; CMSIS global base macros
((identifier) @stm32.peripheral
  (#match? @stm32.peripheral
    "^(PERIPH_BASE|APB1PERIPH_BASE|APB2PERIPH_BASE|AHBPERIPH_BASE)$"))
    
((identifier) @stm32.type
  (#match? @stm32.type "^[A-Z][A-Za-z0-9_]*_TypeDef$"))

;; LL/HAL register access macros
((identifier) @stm32.register
  (#match? @stm32.register
    "^(LL_[A-Z0-9_]+|HAL_[A-Z0-9_]+)$"))

((identifier) @stm32.peripheral
  (#match? @stm32.peripheral "^(EXTI|NVIC|SysTick)$"))

((field_identifier) @stm32.register
  (#match? @stm32.register "^(IMR|EMR|RTSR|FTSR|PR|ISER|ICER|ISPR|ICPR|LOAD|VAL|CTRL)$"))
  
((identifier) @stm32.isr
  (#match? @stm32.isr "^(__disable_irq|__enable_irq|__WFI|__WFE|__SEV)$"))

((pointer_expression
    (unary_expression "*" @stm32.mmio.deref)
    (parenthesized_expression
      (cast_expression
        (type_descriptor)
        (number_literal) @stm32.mmio.address)))

((type_qualifier) @stm32.mmio.volatile
  (#eq? @stm32.mmio.volatile "volatile"))
  
  ;; ================================
  ;;  STM32 HAL FUNCTIONS
  ;; ================================
  ((identifier) @stm32.hal
    (#match? @stm32.hal "^HAL_[A-Za-z0-9_]+$"))

  ;; ================================
  ;;  STM32 LL FUNCTIONS
  ;; ================================
  ((identifier) @stm32.ll
    (#match? @stm32.ll "^LL_[A-Za-z0-9_]+$"))

  ;; ================================
  ;;  HAL/LL CONSTANTS
  ;; ================================
  ((identifier) @stm32.hal.const
    (#match? @stm32.hal.const "^GPIO_PIN_[0-9]+$"))

  ((identifier) @stm32.ll.const
    (#match? @stm32.ll.const "^LL_[A-Z0-9_]+$"))

