; ===== make ${…} stand out (safe) =====
; Delimiters
(template_substitution "$" @punctuation.special)
(template_substitution "{" @punctuation.bracket)
(template_substitution "}" @punctuation.bracket)

; Treat the entire expression region as embedded (no type assumptions)
(template_substitution
  (_) @embedded)
(#set! priority 110)

; Optionally color the opening/closing backticks themselves
(template_string "`" @punctuation.special)

; ===== literals & comments =====
(comment) @comment
(number)  @number
(true)    @boolean
(false)   @boolean
(null)    @constant

; ----- normal quoted strings only (exclude backticks) -----
((string) @string (#match? @string "^\""))
((string) @string (#match? @string "^'"))

; ----- template pieces (not the whole node) -----
(template_text)   @string
(template_escape) @string
(template_dollar) @string

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

