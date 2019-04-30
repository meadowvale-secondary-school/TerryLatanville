/*:
 ## Exercise - Optionals
 
  >Throughout the exercises in this playground, you will be printing optional values. The Swift compiler will display a warning: "Expression implicitly coerced from `Int?` to Any". For the purposes of these exercises, you can ignore this warning.

 Imagine you have an app that asks the user to enter his/her age using the keyboard. When your app allows a user the input text, what is captured for you is given as a `String`. However, you want to store this information as an `Int`. Is it possible for the user to make a mistake and for the input to not match the type you want to store?
 
 Declare a constant `userInputAge` of type `String` and assign it "34e" to simulate a typo while typing age. Then declare a constant `userAge` of type `Int` and use the `Int` initializer and pass in `userInputAge`. What error do you get?
*/
let userInputAge = "34e"
// let userAge: Int = Int(userInputAge)! // Fatal error: Unexpectedly found nil while unwrapping an Optional value


/*:
 Go back and change the type of `userAge` to `Int?`, and print the value of `userAge`. Why is `userAge`'s value `nil`? Provide your answer in a comment or print statement below.
 */
let userAge = Int(userInputAge)
print(userAge) // `nil` because "34e" isn't a valid `Int`

/*:
 Now go back and fix the typo on the value of `userInputAge`. Is there anything about the value printed that seems off?
 
 Print `userAge` again, but this time unwrap `userAge` using the bang operator.
 */
let properUserInputAge = "34"
let properUserAge = Int(properUserInputAge)
print(properUserAge) // Optional(34) because we didn't unwrap the result of the constructor
/*:
 Now use optional binding to unwrap `userAge`. If `userAge` has a value, print it to the console.
 */
print(properUserAge ?? "") // 34
//: page 1 of 6  |  [Next: App Exercise - Finding a Heart Rate](@next)
