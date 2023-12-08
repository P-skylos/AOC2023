#!/usr/local/bin/dyalogscript


lines←(⎕UCS 10)(≠⊆⊢)⊃⎕NGET 'input'
limits←12 13 14
cfilter←{(('([0-9]+) ',⍺) ⎕S '\1')⍵}
cmax←{⌈/¨⍎¨¨((⊂⍵) cfilter¨  lines)}
games←↓[1]↑cmax¨'red' 'green' 'blue'
⎕←+/×/¨games
