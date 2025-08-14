; Text objects for ucode (Vim mode navigation)
;------------------------------------------------

; Functions
(function_declaration
  body: (statement_block
    "{" @_start
    (_)* @function.inside
    "}" @_end)) @function.around

(function_expression
  body: (statement_block
    "{" @_start
    (_)* @function.inside
    "}" @_end)) @function.around

(method_definition
  body: (statement_block
    "{" @_start
    (_)* @function.inside
    "}" @_end)) @function.around

; Parameters (function arguments)
(formal_parameters
  "(" @_start
  (_)* @parameter.inside
  ")" @_end) @parameter.around

; Calls (function calls with arguments)
(call_expression
  arguments: (arguments
    "(" @_start
    (_)* @call.inside
    ")" @_end)) @call.around

; Blocks (statement blocks)
(statement_block
  "{" @_start
  (_)* @block.inside
  "}" @_end) @block.around

; Objects
(object
  "{" @_start
  (_)* @class.inside
  "}" @_end) @class.around

; Arrays
(array
  "[" @_start
  (_)* @class.inside
  "]" @_end) @class.around

; Comments
(comment) @comment.around

; If statements
(if_statement
  consequence: (statement_block
    "{" @_start
    (_)* @conditional.inside
    "}" @_end)) @conditional.around

; For loops
(for_statement
  body: (statement_block
    "{" @_start
    (_)* @loop.inside
    "}" @_end)) @loop.around

(for_in_statement
  body: (statement_block
    "{" @_start
    (_)* @loop.inside
    "}" @_end)) @loop.around

; While loops
(while_statement
  body: (statement_block
    "{" @_start
    (_)* @loop.inside
    "}" @_end)) @loop.around

; Switch statements
(switch_statement
  body: (switch_body
    "{" @_start
    (_)* @conditional.inside
    "}" @_end)) @conditional.around