;; ------------------------------------------------------------
;; Pointer Flow (realne, działające)
;; ------------------------------------------------------------

(pointer_expression
  "*" @pointer.read)

(unary_expression
  "&" @pointer.address)

(field_expression
  "->" @pointer.write)

;; ------------------------------------------------------------
;; Memory Flow (realne, działające)
;; ------------------------------------------------------------

(call_expression
  function: (identifier) @memory.alloc
  (#eq? @memory.alloc "malloc"))

(call_expression
  function: (identifier) @memory.free
  (#eq? @memory.free "free"))

;; ------------------------------------------------------------
;; Execution Path (realne, uproszczone)
;; ------------------------------------------------------------

(if_statement) @exec.primary
(while_statement) @exec.secondary
(for_statement) @exec.secondary
(return_statement) @exec.tertiary

;; ------------------------------------------------------------
;; Risk Zones (realne, uproszczone)
;; ------------------------------------------------------------

(null) @risk.danger
(assignment_expression
  left: (identifier) @risk.warning
  right: (null))

