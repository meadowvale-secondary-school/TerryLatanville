/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
let myCollection: [Any] = [3.14159, 42, "Hello World", true]
print(myCollection)

/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
myCollection.forEach { element in
    switch element {
    case is Double:
        print("The double has a value of: \(element)")
    case is Int:
        print("The integer has a value of: \(element)")
    case is String:
        print("The string has a value of: \(element)")
    case is Bool:
        print("The bool has a value of: \(element)")

    default:
        print("I have no idea what \(element) is!")
    }
}

/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
let myDictionary: [String: Any] = ["double": 3.14159, "int": 42, "string": "Hello World", "bool": true]
print(myDictionary)
/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
var total = 0.0
myDictionary.forEach { _, value in
    switch value {
    case is Double:
        total += value as! Double
    case is Int:
        total += Double(exactly: value as! Int)!
    case is String:
        total += 1
    case is Bool:
        total += value as! Bool ? 2 : -3

    default:
        print("I have no idea how to add \(value)")
    }
}
print("The total is: \(total)")
/*:
 Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 */
var total2 = 0.0
myDictionary.forEach { _, value in
    switch value {
    case is Double:
        total2 += value as! Double
    case is Int:
        total2 += Double(exactly: value as! Int)!
    case is String:
        if let stringValue = Double(value as! String) {
            total2 += stringValue
        }

    default:
        print("I have no idea how to add \(value)")
    }
}
print("The new total is: \(total2)")

//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
