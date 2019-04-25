/*:
 ## Exercise - Constants
 
 Declare a constant called `friends` to represent the number of friends you have on social media. Give it a value between 50 and 1000. Print out the value by referencing your constant.
 */
let friends = 50
print("I have \(friends) friends")
/*:
 Now assume you go through and remove friends that aren't active on social media. Update your `friends` constant to a lower number than it currently is.
 */
// friends -= 10 // Left side of mutating operator isn't mutable: 'friends' is a 'let' constant

/*:
 Does the above code compile? Why not? Print your explanation to the console using the `print` function. Go back and delete your line of code that updates the `friend` constant to a lower number so that the playground will compile properly.
 */
print("'friends' can't be changed because it's a constant")

//: page 1 of 10  |  [Next: App Exercise - Step Goal](@next)