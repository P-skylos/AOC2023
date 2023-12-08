#!/usr/local/bin/dyalogscript

⍝ find the max number associated with each color in one game
⍝each game is reduced to 3 numbers
⍝ then return the indices of all games where each color's max is less than the target max
lines←(⎕UCS 10)(≠⊆⊢)⊃⎕NGET 'input'
limits←12 13 14
cfilter←{(('([0-9]+) ',⍺) ⎕S '\1')⍵}
cmax←{⌈/¨⍎¨¨((⊂⍵) cfilter¨  lines)}
games←↓[1]↑cmax¨'red' 'green' 'blue'
possibles←{(∧/¨limits∘≥¨⍵)/⍳≢⍵}games
⎕←+/possibles