/*:
 ## Exercise - Types and Type Safety
 
 Declare two variables, one called `firstDecimal` and one called `secondDecimal`. Both should have decimal values. Look at both of their types by holding Option and clicking on the variable name.
 */
var firstDecimal = 0.0
var secondDecimal = 0.0
/*:
 Declare a variable called `trueOrFalse` and give it a boolean value. Try to assign it to `firstDecimal` like so: `firstDecimal = trueOrFalse`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
 */
var trueOrFalse = false
// firstDecimal = trueOrFalse // Cannot assign value of type 'Bool' to type 'Double' #TypeSafety
print("'firstDecimal' and 'trueOrFalse' are different types, we can't assign from one to the other")
/*:
 Declare a variable and give it a string value. Then try to assign it to `firstDecimal`. Does it compile? Print a statement to the console explaining why not, and remove the line of code that will not compile.
 */
var stringExample = "Hello World"
// firstDecimal = stringExample // Cannot assign value of type 'String' to type 'Double' #TypeSafety
print("'firstDecimal' and 'stringExample' are different types, we can't assign from one to the other")
/*:
 Finally, declare a variable with a whole number value. Then try to assign it to `firstDecimal`. Why won't this compile even though both variables are numbers? Print a statement to the console explaining why not, and remove the line of code that will not compile.
 */
var wholeNumber = 3
// firstDecimal = wholeNumber // Cannot assign value of type 'Int' to type 'Double' #TypeSafety
print("'firstDecimal' and 'wholeNumber' are different types, we can't assign from one to the other")
//: [Previous](@previous)  |  page 7 of 10  |  [Next: App Exercise - Tracking Different Types](@next)
