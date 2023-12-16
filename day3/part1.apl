#!/usr/local/bin/dyalogscript

⍝ we want to select a window around each number and then check that window for non-number, non-periods
grid←↑(⎕UCS 10)(≠⊆⊢)⊃⎕NGET 'input'
⎕←syms←∪∊('[^.0-9]'⎕S{⍵.Match})∊grid
convolve←{(~⍵)∧({∨/,⍵}⌺3 3)⍵}
adj←convolve syms∊⍨grid
nums←grid∊'01234567890'
⍝ now if any num is touching an adj i want it to flood horizontally
⍝ flood says take a two binary arrays, one is a source, one is a map.
⍝ flood 0 is source∧map. flood 1 is every true cell in map adjacent to a true cell in flood 0 is true
⍝ vecFlood←{⍺∧({∨/⍵}⌺3)⍺∧⍵}
hflood←({⍺∧⍪({∨/⍵}⌺1 3)⍺∧⍵}⍣{∧/∧/⍺=⍵})
⍝ we use horizontal convolution and repeat until we hit a stable point
filter←nums hflood adj
⎕←+/⍎'0',⍨∊(','@{~filter})grid