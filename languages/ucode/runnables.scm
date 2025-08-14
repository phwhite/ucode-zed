; Runnable code detection for ucode
;----------------------------------

; Main function (entry point)
(function_declaration
  name: (identifier) @run
  (#eq? @run "main")
  (#set! tag main-function))

; Test functions (common pattern)
(function_declaration
  name: (identifier) @run
  (#match? @run "^test")
  (#set! tag test-function))

; Functions that start with "run" or "exec"
(function_declaration
  name: (identifier) @run
  (#match? @run "^(run|exec)")
  (#set! tag executable-function))

; Script files with shebang
(program
  (hash_bang_line) @run
  (#set! tag script-file))

; Standalone expressions at top level (for quick execution)
(expression_statement
  (_) @run
  (#set! tag expression))