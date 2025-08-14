; Code outline for ucode
;----------------------

; Function declarations
(function_declaration
  name: (identifier) @name) @item

; Function expressions assigned to variables
(variable_declarator
  name: (identifier) @name
  value: [(function_expression) (arrow_function)]) @item

(lexical_declaration
  (variable_declarator
    name: (identifier) @name
    value: [(function_expression) (arrow_function)])) @item

; Method definitions in objects
(method_definition
  name: (property_identifier) @name) @item

; Object method assignments
(pair
  key: (property_identifier) @name
  value: [(function_expression) (arrow_function)]) @item

; Variable declarations (top-level constants and lets)
(lexical_declaration
  (variable_declarator
    name: (identifier) @name)) @item

(variable_declaration
  (variable_declarator
    name: (identifier) @name)) @item

; Import declarations
(import_statement) @item

; Export declarations
(export_statement) @item

; Class-like constructor functions (starting with capital letter)
((function_declaration
  name: (identifier) @name) @item
 (#match? @name "^[A-Z]"))

; Assignment expressions (for function assignments)
(assignment_expression
  left: (identifier) @name
  right: [(function_expression) (arrow_function)]) @item
