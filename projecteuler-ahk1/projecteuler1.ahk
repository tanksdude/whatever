; Project Euler Problem #1
; I'm not very good at using AHK as an "actual" programming language so this code isn't the best

; Problem #1 text:
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.

; code
#SingleInstance

NUM := 1000 - 1
arr := []
arrlength := 0

counter := 1
while counter <= floor(NUM/3)
{
	arr.Push(counter * 3)
	arrlength := arrlength + 1
	counter := counter + 1
}
; brackets are required to be like this, unless they're for single line statements (at least I'm pretty sure)

counter := 1
while counter <= floor(NUM/5)
{
	if arr not in counter*5 ; such backwards syntax
	{
		arr.Push(counter * 5)
		arrlength := arrlength + 1
	}
	counter := counter + 1
}

counter := 1
answer := 0
while counter <= arrlength
{
	answer := answer + arr[counter]
	counter := counter + 1
}

; "printing" the answer

nothing := ""
if (answer == nothing) {
	answer := "something failed"
}

msgbox, %answer%

ExitApp