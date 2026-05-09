;; ============================================================
;; POINTER FLOW
;; ============================================================

;; ptr->field → warp out
(pointer_expression
  operator: "->"
) @ptr.warp.out

;; *ptr → warp in
(unary_expression
  operator: "*"
) @ptr.warp.in

;; neutralne użycie wskaźnika
(identifier) @ptr.warp.neutral


;; ============================================================
;; MEMORY FLOW
;; ============================================================

;; malloc / calloc / realloc → alloc
(call_expression
  function: (identifier) @fn
  (#match? @fn "malloc|calloc|realloc")
) @memory.alloc

;; free → free
(call_expression
  function: (identifier) @fn
  (#eq? @fn "free")
) @memory.free


;; ============================================================
;; SEMANTIC GRAVITY
;; ============================================================

(if_statement) @gravity.medium
(switch_statement) @gravity.strong
(else_clause) @gravity.weak


;; ============================================================
;; RISK ZONES
;; ============================================================

;; NULL → danger
(identifier) @risk.danger
  (#eq? @risk.danger "NULL")

;; 0 jako pointer literal → warning
(number_literal) @risk.warning
  (#eq? @risk.warning "0")

;; free(NULL) → danger
(call_expression
  function: (identifier) @fn
  arguments: (argument_list (identifier) @arg)
  (#eq? @fn "free")
  (#eq? @arg "NULL")
) @risk.danger


;; ============================================================
;; BRANCH ENTROPY
;; ============================================================

;; ==
(binary_expression
  operator: "=="
) @entropy.low

;; &&
(binary_expression
  operator: "&&"
) @entropy.medium

;; ||
(binary_expression
  operator: "||"
) @entropy.high


;; ============================================================
;; WORMHOLES (chain calls)
;; ============================================================

(call_expression
  (call_expression
    (call_expression) @wormhole.entry)
) @wormhole.exit


;; ============================================================
;; QUANTUM LAYER
;; ============================================================

;; a + b
(binary_expression
  operator: "+"
) @quantum.superposition

(identifier) @quantum.entangled.a
(identifier) @quantum.entangled.b


;; ============================================================
;; SEMANTIC ENERGY MAP
;; ============================================================

(identifier) @energy.low
(binary_expression) @energy.medium
(call_expression) @energy.high
