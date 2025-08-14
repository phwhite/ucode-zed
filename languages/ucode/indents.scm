; Indentation rules for ucode
;----------------------------

; Block structures that should indent their contents
(statement_block "{" @start "}" @end) @indent
(object "{" @start "}" @end) @indent
(array "[" @start "]" @end) @indent

; Function bodies
(function_declaration
  body: (statement_block) @indent)

(function_expression
  body: (statement_block) @indent)

(method_definition
  body: (statement_block) @indent)

; Control flow structures
(if_statement
  consequence: (statement_block) @indent)

(else_clause
  (statement_block) @indent)

(switch_body "{" @start "}" @end) @indent

(switch_case
  body: (_) @indent)

(switch_default
  body: (_) @indent)

; Loops
(for_statement
  body: (statement_block) @indent)

(for_in_statement
  body: (statement_block) @indent)

(while_statement
  body: (statement_block) @indent)

(do_statement
  body: (statement_block) @indent)

; Exception handling
(try_statement
  body: (statement_block) @indent)

(catch_clause
  body: (statement_block) @indent)

(finally_clause
  body: (statement_block) @indent)

; Expressions that span multiple lines
(parenthesized_expression "(" @start ")" @end) @indent

; Template strings (for multiline templates)
(template_string "`" @start "`" @end) @indent

