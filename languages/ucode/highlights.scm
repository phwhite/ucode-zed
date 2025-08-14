; Color the opening/closing backticks themselves
(template_string "`" @punctuation.special)

;; Strings
(string) @string
(template_string) @string
(escape_sequence) @string.escape

;; Template interpolation: highlight inner expression; delimiters inherit
(template_substitution
  (_)) @embedded

; ===== literals & comments =====
(hash_bang_line) @comment
(comment) @comment
(number)  @number
(true)    @boolean
(false)   @boolean
(null)    @constant

; ----- normal quoted strings only (exclude backticks) -----
((string) @string (#match? @string "^\""))
((string) @string (#match? @string "^'"))

; ===== identifiers, vars, params =====
(identifier) @variable
(variable_declarator name: (identifier) @variable)
(formal_parameters (identifier) @variable.parameter)

; ===== properties (dot access + object keys) =====
(member_expression property: (identifier) @property)
(pair key: (property_identifier) @property)
(pair key: (string) @property)
(pair key: (number) @property)
(shorthand_property_identifier) @property

; ===== functions =====
(function_declaration name: (identifier) @function)
(call_expression function: (_) @function)

; ===== keywords & operators present in your grammar =====
[
  "if" "else" "while" "for" "in"
  "return" "break" "continue"
  "function" "let" "const" "var"
  "typeof" "void" "delete"
] @keyword

[
  "||" "&&" "|" "^" "&"
  "==" "===" "!=" "!=="
  "<" "<=" ">" ">="
  "<<" ">>" ">>>"
  "+" "-" "*" "/" "%" "**"
  "=" "+=" "-=" "*=" "/=" "%=" "**="
  "?" ":" "." "," ";"
] @operator

; ===== import =====
(import_statement
  "import" @keyword)

(import_statement
  "from" @keyword)

(import_statement
  source: (string) @string)

(import_namespace
  "*" @operator
  "as" @keyword
  name: (identifier) @namespace)

(import_named
  "{" @punctuation.bracket
  "}" @punctuation.bracket)

(import_named
  "," @punctuation.delimiter)

(import_specifier
  name:  (identifier) @variable
  alias: (identifier) @variable)
