; Comments and Documentation
;---------------------------
(hash_bang_line) @comment
(comment) @comment

; Literals and Constants
;-----------------------
[
  (true)
  (false)
  (null)
  (undefined)
] @constant.builtin

(number) @number

; Strings and Templates
;----------------------
(string) @string
(template_string) @string
(escape_sequence) @string.escape

(template_string "`" @punctuation.special)
(template_substitution
  "${" @punctuation.special
  "}" @punctuation.special)

(template_substitution
  (_) @embedded)

; Variables and Parameters
;-------------------------
(identifier) @variable

; Function parameters
(formal_parameters (identifier) @variable.parameter)
(variable_declarator name: (identifier) @variable)

; Properties and Object Keys
;---------------------------
(property_identifier) @property

(member_expression
  property: (property_identifier) @property)

(pair
  key: (property_identifier) @property)
(pair
  key: (string) @property)
(pair
  key: (number) @property)

(shorthand_property_identifier) @property

; Functions and Methods
;----------------------
(function_declaration
  name: (identifier) @function)
(function_expression
  name: (identifier) @function)

(method_definition
  name: (property_identifier) @function.method)

; Function calls
(call_expression
  function: (identifier) @function.call)
(call_expression
  function: (member_expression
    property: (property_identifier) @function.method.call))

; Function assignments
(variable_declarator
  name: (identifier) @function
  value: [(function_expression) (arrow_function)])

(assignment_expression
  left: (identifier) @function
  right: [(function_expression) (arrow_function)])

(pair
  key: (property_identifier) @function.method
  value: [(function_expression) (arrow_function)])

; UCode Built-in Functions
;-------------------------
; Core ucode built-ins from UCODE.md
((identifier) @function.builtin
 (#match? @function.builtin "^(print|warn|printf|sprintf|type|length|exists|push|pop|shift|unshift|slice|splice|sort|reverse|join|index|rindex|uniq|values|map|filter|reduce|keys|substr|split|trim|ltrim|rtrim|lc|uc|replace|match|ord|chr|int|min|max|abs|round|floor|ceil|json|jsonstr|gc|require|include|sourcepath)$"))

; Special identifiers
;--------------------
((identifier) @constructor
 (#match? @constructor "^[A-Z]"))

; Constants (ALL_CAPS)
([
  (identifier)
  (shorthand_property_identifier)
  (shorthand_property_identifier_pattern)
] @constant
(#match? @constant "^[A-Z_][A-Z\\d_]+$"))

; Built-in variables
((identifier) @variable.builtin
 (#match? @variable.builtin "^(arguments|REQUIRE_SEARCH_PATH)$"))

; Keywords
;---------
[
  "as"
  "break"
  "case"
  "catch"
  "const"
  "continue"
  "debugger"
  "default"
  "delete"
  "do"
  "else"
  "export"
  "finally"
  "for"
  "from"
  "function"
  "get"
  "if"
  "import"
  "in"
  "let"
  "of"
  "return"
  "set"
  "static"
  "switch"
  "throw"
  "try"
  "typeof"
  "using"
  "var"
  "void"
  "while"
  "with"
] @keyword

; Operators
;----------
[
  "!"
  "!="
  "!=="
  "%"
  "%="
  "&"
  "&&"
  "&="
  "*"
  "**"
  "**="
  "*="
  "+"
  "++"
  "+="
  "-"
  "--"
  "-="
  "/"
  "/="
  "<"
  "<<"
  "<<="
  "<="
  "="
  "=="
  "==="
  "=>"
  ">"
  ">="
  ">>"
  ">>="
  ">>>"
  ">>>="
  "?"
  "??"
  "??="
  "^"
  "^="
  "|"
  "||"
  "|="
  "~"
  "&&="
  "||="
] @operator

; Punctuation
;------------
[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

[
  ";"
  (optional_chain)
  "."
  ","
  ":"
] @punctuation.delimiter

; Import/Export
;--------------
(import_statement
  "import" @keyword.control.import)

(import_statement
  "from" @keyword.control.import)

(import_statement
  source: (string) @string)

(export_statement
  "export" @keyword.control.export)

(namespace_import
  "*" @operator
  "as" @keyword.control.import)

(namespace_export
  "*" @operator
  "as" @keyword.control.export)

; JSX/HTML (if supported)
;------------------------
(jsx_element) @tag
(jsx_self_closing_element) @tag
(jsx_opening_element) @tag
(jsx_closing_element) @tag

; Control Flow
;-------------
(if_statement "if" @keyword.control.conditional)
(else_clause "else" @keyword.control.conditional)
(switch_statement "switch" @keyword.control.conditional)
(switch_case "case" @keyword.control.conditional)
(switch_default "default" @keyword.control.conditional)

(for_statement "for" @keyword.control.repeat)
(for_in_statement "for" @keyword.control.repeat)
(while_statement "while" @keyword.control.repeat)
(do_statement "do" @keyword.control.repeat)

(return_statement "return" @keyword.control.return)
(throw_statement "throw" @keyword.control.exception)
(try_statement "try" @keyword.control.exception)
(catch_clause "catch" @keyword.control.exception)
(finally_clause "finally" @keyword.control.exception)
