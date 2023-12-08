#!/usr/local/bin/dyalogscript
⎕IO ← 1
data←⊃⎕NGET 'input'
nums ← '0123456789'
snums ← 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine'
fusions←(∊∘.{⊃⌽⍺=⊃⍵}⍨snums)/,∘.{⍺,1↓⍵}⍨snums
fusionnums←(∊∘.{⊃⌽⍺=⊃⍵}⍨snums)/,∘.{(⍕snums⍳⊂⍺),(⍕snums⍳⊂⍵)}⍨snums
lines←(⎕UCS 10)(≠⊆⊢)data
⍝ for i = 0-9 search lines for snums[i] and replace with i
newlines←(fusions ⎕R{⍕fusionnums[fusions⍳⊂⍵.Match]})lines
newlines←(snums ⎕R{⍕snums⍳⊂⍵.Match})newlines
⍞←+/⍎¨{⌽2⍴¯1⌽⍵/⍨⍵∊nums}¨newlines
⍝ this number is currently too high, my best guess is because something like eightwo should become 82 instead of 8wo
⍝ i should generate these conjoined numbers
⍝ ∘.{⊃⌽⍺=⊃⍵:⎕←⍺,1↓⍵}⍨snums or (∊∘.{⊃⌽⍺=⊃⍵}⍨snums)/,∘.{⍺,1↓⍵}⍨snums
⍝ oneight twone threeight fiveight sevenine eightwo eighthree nineight
