;; ------------------------------------------------------------
;; Pointer Flow (realne, działające)
;; ------------------------------------------------------------

;;(pointer_expression
;;  "*" @pointer.read)

;;(unary_expression
;;  "&" @pointer.address)

;;(field_expression
;;  "->" @pointer.write)


;; Pointer Warp Glow
;; ptr->field
((pointer_expression
   operator: "->") @ptr.warp.out)

;; *ptr
((unary_expression
   operator: "*") @ptr.warp.in)

;; neutralne użycie wskaźnika
((identifier) @ptr.warp.neutral)

;; ------------------------------------------------------------
;; Memory Flow (realne, działające)
;; ------------------------------------------------------------

;;(call_expression
;;  function: (identifier) @memory.alloc
;;  (#eq? @memory.alloc "malloc"))

;;(call_expression
;;  function: (identifier) @memory.free
;;  (#eq? @memory.free "free"))

;; Memory Flow Glow
;; malloc / calloc / realloc → alloc
(call_expression
  function: (identifier) @fn)
  (#match? @fn "malloc|calloc|realloc")
  @memory.alloc)

;; free → free
(call_expression
  function: (identifier) @fn)
  (#eq? @fn "free")
  @memory.free)


;; ------------------------------------------------------------
;; Execution Path (realne, uproszczone)
;; ------------------------------------------------------------

;;(if_statement) @exec.primary
;;(while_statement) @exec.secondary
;;(for_statement) @exec.secondary
;;(return_statement) @exec.tertiary

;; if / else / switch
((if_statement) @gravity.medium)
((switch_statement) @gravity.strong)
((else_clause) @gravity.weak)

;; ------------------------------------------------------------
;; Risk Zones (realne, uproszczone)
;; ------------------------------------------------------------

;; NULL → najwyższe ryzyko
((identifier) @risk.danger
  (#eq? @risk.danger "NULL"))

;; 0 jako wskaźnik → ryzyko
((number_literal) @risk.warning
  (#eq? @risk.warning "0"))

;; free(NULL) → ryzyko
(call_expression
  function: (identifier) @fn
  arguments: (argument_list (identifier) @arg))
  (#eq? @fn "free")
  (#eq? @arg "NULL")
  @risk.danger)

;; ------------------------------------------------------------
;; Branch Entropy
;; ------------------------------------------------------------

;; proste warunki → low entropy
((binary_expression
   operator: "==") @entropy.low)

;; złożone warunki → medium
((binary_expression
   operator: "&&") @entropy.medium)

;; bardzo złożone → high
((binary_expression
   operator: "||") @entropy.high)

;; ------------------------------------------------------------
;; Wormholes (chain calls)
;; ------------------------------------------------------------
;; foo()->bar()->baz()
((call_expression
   (call_expression
     (call_expression) @wormhole.entry))
   @wormhole.exit)


;; ------------------------------------------------------------
;; Quantum Layer
;; ------------------------------------------------------------
;; a = b + c;
((binary_expression
   operator: "+") @quantum.superposition)

((identifier) @quantum.entangled.a)
((identifier) @quantum.entangled.b)


;; ------------------------------------------------------------
;; Semantic Energy Map
;; ------------------------------------------------------------
;; low energy
((identifier) @energy.low)

;; medium energy
((binary_expression) @energy.medium)

;; high energy
((call_expression) @energy.high)

