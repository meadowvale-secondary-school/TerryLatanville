/*:
 ## Exercise - Enumerations
 
 Define a `Suit` enum with four possible cases: `clubs`, `spades`, `diamonds`, and `hearts`.
 */
enum Suit: String {
    case clubs = "Clubs"
    case spades = "Spades"
    case diamonds = "Diamonds"
    case hearts = "Hearts"
}

/*:
 Imagine you are being shown a card trick and have to draw a card and remember the suit. Create a variable instance of `Suit` called `cardInHand` and assign it to the `hearts` case. Print out the instance.
 */
var cardInHand: Suit = .hearts

/*:
 Now imagine you have to put back the card you drew and draw a different card. Update the variable to be a spade instead of a heart.
 */
cardInHand = .spades

/*:
 Imagine you are writing an app that will display a fun fortune (i.e. something like "You will soon find what you seek.") based on cards drawn. Write a function called `getFortune(cardSuit:)` that takes a parameter of type `Suit`. Inside the body of the function, write a switch statement based on the value of `cardSuit`. Print a different fortune for each `Suit` value. Call the function a few times, passing in different values for `cardSuit` each time.
 */
func getFortune(cardSuit: Suit) {
    switch cardSuit {
    case .clubs:
        print("You will soon find what you seek.")
    case .spades:
        print("You have recently visited a far away place.")
    case .diamonds:
        print("You will be showered with praise.")
    case .hearts:
        print("You give too much of yourself.")
    }
}

getFortune(cardSuit: .clubs)
getFortune(cardSuit: .spades)
getFortune(cardSuit: .diamonds)
getFortune(cardSuit: .hearts)

/*:
 Create a `Card` struct below. It should have two properties, one for `suit` of type `Suit` and another for `value` of type `Int`.
 */
struct Card: CustomStringConvertible {
    enum Value: String {
        case ace = "Ace"
        case two = "Two"
        case three = "Three"
        case four = "Four"
        case five = "Five"
        case six = "Six"
        case seven = "Seven"
        case eight = "Eight"
        case nine = "Nine"
        case ten = "Ten"
        case jack = "Jack"
        case queen = "Queen"
        case king = "King"
    }
    let suit: Suit
    // let value: Int
    let value: Value

    var description: String {
        return "\(value.rawValue) of \(suit.rawValue)"
    }
}

/*:
 How many values can playing cards have? How many values can `Int` be? It would be safer to have an enum for the card's value as well. Inside the struct above, create an enum for `Value`. It should have cases for `ace`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`, `jack`, `queen`, `king`. Change the type of `value` from `Int` to `Value`. Initialize two `Card` objects and print a statement for each that details the card's value and suit.
 */
let aceOfClubs = Card(suit: .clubs, value: .ace)
print("You drew the \(aceOfClubs)")
let tenOfSpades = Card(suit: .spades, value: .ten)
print("You drew the \(tenOfSpades)")

//: page 1 of 2  |  [Next: App Exercise - Swimming Workouts](@next)
