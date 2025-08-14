; Language injections for ucode
;------------------------------

; Template string interpolation (expressions inside ${})
(template_substitution
  (_) @injection.content)
(#set! injection.language "ucode")

; JSDoc comments
((comment) @injection.content
 (#set! injection.language "jsdoc")
 (#match? @injection.content "^/\\*\\*"))

; SQL in string literals (common pattern in ucode)
((string) @injection.content
 (#match? @injection.content "(SELECT|INSERT|UPDATE|DELETE|CREATE|DROP|ALTER)")
 (#set! injection.language "sql"))

; Regular expressions in match/replace function calls
(call_expression
  function: (identifier) @_func
  arguments: (arguments
    (string) @injection.content)
  (#match? @_func "^(match|replace)$")
  (#set! injection.language "regex"))

; JSON strings
((string) @injection.content
 (#match? @injection.content "^[\"']\\s*[{\\[]")
 (#set! injection.language "json"))

; HTML/XML in template strings or string literals
((template_string) @injection.content
 (#match? @injection.content "<[^>]+>")
 (#set! injection.language "html"))

((string) @injection.content
 (#match? @injection.content "<[^>]+>")
 (#set! injection.language "html"))

; CSS in template strings
((template_string) @injection.content
 (#match? @injection.content "(css|style)")
 (#set! injection.language "css"))
