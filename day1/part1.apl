#!/usr/local/bin/dyalogscript
data←⊃⎕NGET 'input'
nums ← '1234567890'
⍞←+/⍎¨{⌽2⍴¯1⌽⍵/⍨⍵∊nums}¨(⎕UCS 10)(≠⊆⊢)data
⍝(≠⊆⊢) splits a string on newline
⍝(⎕UCS 10) looks up the unicode value of 10 which is newline
⍝{⍵/⍨⍵∊nums} uses a bit mask to pull out just the numerals
⍝⌽2⍴¯1⌽ rotates the last digit to front and then pulls off the first two digits and flips their order