; Bracket pairs for ucode
;------------------------

; Basic brackets
("(" @open ")" @close)
("[" @open "]" @close)
("{" @open "}" @close)

; String delimiters
("\"" @open "\"" @close)
("'" @open "'" @close)

; Template strings
("`" @open "`" @close)

; Template substitution
("${" @open "}" @close)

; JSX brackets (if applicable)
("<" @open ">" @close)
("</" @open ">" @close)
