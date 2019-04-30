/*:
 ## Exercise - Failable Initializers
 
 Create a `Computer` struct with two properties, `ram` and `yearManufactured`, where both parameters are of type `Int`. Create a failable initializer that will only create an instance of `Computer` if `ram` is greater than 0, and if `yearManufactured` is greater than 1970, and less than 2017.
 */
struct Computer {
    let ram: Int
    let yearManufactured: Int

    init?(ram: Int, yearManufactured: Int) {
        guard ram > 0 && yearManufactured > 1970 && yearManufactured < 2017 else {
            return nil
        }
        self.ram = ram
        self.yearManufactured = yearManufactured
    }
}

/*:
 Create two instances of `Computer?` using the failable initializer. One instance should use values that will have a value within the optional, and the other should result in `nil`. Use if-let syntax to unwrap each of the `Computer?` objects and print the `ram` and `yearManufactured` if the optional contains a value.
 */
if let computer1 = Computer(ram: 0, yearManufactured: 1980) {
    print("computer1 has \(computer1.ram) KB of RAM and was manufactured in \(computer1.yearManufactured)")
} else {
    print("Non-viable computer was created!") // Prints
}
if let computer2 = Computer(ram: 16, yearManufactured: 1971) {
    print("computer2 has \(computer2.ram) KB of RAM and was manufactured in \(computer2.yearManufactured)") // Prints
} else {
    print("Non-viable computer was created!")
}

//: [Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Workout or Nil](@next)
