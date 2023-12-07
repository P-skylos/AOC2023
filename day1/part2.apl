#!/usr/local/bin/dyalogscript
⎕IO ← 0
data←⊃⎕NGET 'input'
nums ← '0123456789'
snums ← 'zero' 'one' 'two' 'three' 'four' 'five' 'six' 'seven' 'eight' 'nine'
lines←(⎕UCS 10)(≠⊆⊢)data
⍝ for i = 0-9 search lines for snums[i] and replace with i
lines←(snums ⎕R{⍕snums⍳⊂⍵.Match})lines
⍞←+/⍎¨{⌽2⍴¯1⌽⍵/⍨⍵∊nums}¨lines