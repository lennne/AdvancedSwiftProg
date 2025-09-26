import UIKit

var greeting = "Hello, playground"

//a protocol is a set of rules
//it's basically like interfaces in java

//Creating protocols is like setting the expectations upfront so that down the line, people know the responsibility of each constituent,


protocol Employee {
//    Suppose Little Lemon has an internal HR system to manage employees.
    //Using a protocol, I can set up the expectations for employees, including employee-specific detail.
    //For instance, each employee has a name and a defined primary duty. In addition, I can use a protocol to store the number of days an employee has worked.
    var name: String {get}
    var numberOfDaysWorked: Int{get set}
    func executePrimaryDuty()
    func danceToHappyBirthdaySong(Lyrics: String)
}

//inheriting protocols with a class
protocol GoodChef{
    func cookGoodFood()
}

protocol GreatChef{
    func cookGreatFood()
}

protocol ExcellentChef{
    func cookExcellentFood()
}

//when working with protocols, you will also hear developers say “make the ClassName class adopt the ProtocolName protocol.”
//This has the equivalent instruction of making the ClassName class inherit the ProtocolName protocol.


//class Person: GoodChef, GreatChef {
//    func cookGreatFood() {
//        <#code#>
//    }
//    //In the code above, the Person class adopts and conforms to the second protocol, GreatChef.
//    func cookGoodFood() {
//        <#code#>
//    }
//}
//
////extension is basically adding code to an existing class rather than modifying it(helps follow the solid principle)
//extension Person: ExcellentChef {
//    func cookExcellentFood() {
//        <#code#>
//    }
//}

//An extension block is declared that makes Person adopt and conform to the ExcellentChef protocol.
//As a rule of thumb, use an extension for each protocol adoption and conformance. This keeps protocol-related code organized in an extension block.
//class Person {
//}
//extension Person: GoodChef {
//    func cookGoodFood() {
//    }
//}
//extension Person: GreatChef {
//    func cookGreatFood() {
//    }
//}
//extension Person: ExcellentChef {
//    func cookExcellentFood() {
//    }
//}

//Another thing you can do with a protocol is to create a protocol that inherits other protocols.
//Instead of inheriting each individual protocol, you can have a protocol that encompasses the individual protocol requirements.
//By inheriting GoodChef, GreatChef, and ExcellentChef with a new protocol called BlackBeltChef, the code reads:
//protocol BlackBeltChef: GoodChef, GreatChef, ExcellentChef {
//    func cookBlackBeltFood()
//}
//
//class Individual: BlackBeltChef {
//    func cookBlackBeltFood() {
//        <#code#>
//    }
//    
//    func cookGoodFood() {
//        <#code#>
//    }
//    
//    func cookGreatFood() {
//        <#code#>
//    }
//    
//    func cookExcellentFood() {
//        <#code#>
//    }
//    
//    
//}

protocol Dish {
    var name: String {get}
    var preparationMinutes: Int {get set}
    
    func prepare()
    func plate(artisticLevel: Int)
}

class MainDish: Dish{
    let name: String
    var preparationMinutes: Int
    init (name: String, preparationMinutes: Int){
        self.name = name
        self.preparationMinutes = preparationMinutes
    }
    
    func prepare(){
        print("Preparing \(name) for \(preparationMinutes) minutes")
    }
    
    func plate(artisticLevel: Int){
        print("Plating artistic Level: \(artisticLevel)")
    }
    
}

var ourDish = MainDish(name: "Super Spaghetti", preparationMinutes: 35)
ourDish.prepare()
ourDish.plate(artisticLevel: 10)

protocol Driver {
    var name: String {get}
    func driveToDestination(_ destination: String, with food: String)
}

class DeliveryDriver: Driver {
    let name: String
    init(name: String){
        self.name = name
    }
    func driveToDestination(_ destination: String, with food: String){
        print("\(name) is driving to \(destination) to deliver \(food)")
    }
}

class LittleLemon {
    var deliveryDriver: Driver?
    init(){}
    func deliverFood(_ food: String,to destination: String){
        if let deliveryDriver = deliveryDriver {
            deliveryDriver.driveToDestination(destination, with: food)
        } else {
            print("no delivery driver")
        }
    }
}

let bob = DeliveryDriver(name: "Bob")
let littlelemon = LittleLemon()
littlelemon.deliverFood("Super Spaghetti", to: "1 Spaghetti Lane")
littlelemon.deliveryDriver = bob
littlelemon.deliverFood("Super Spaghetti", to: "1 Spaghetti Lane")

//ERROR HANDLING
enum BadError: Error{
    case NumberIsTooLarge
    case NumberIsTooSmall
}
func throwAnError() throws {
    throw BadError.NumberIsTooSmall
}

do{
    try throwAnError()
}catch BadError.NumberIsTooLarge{
    print("Number shouldn't be too large")
}catch{
    print("the error is \(error)")
}

//Error handling approaches
// try! and try?
// try! lets you call a throwable function outside of the do-catch statement, it is used when you're sure the particular function will not throw errors, not advised to use try! in production
// whilst try? the try? expression simplifies error handling when you want to handle all errors in the same way.

//try!
//do {
//    let image = try! loadImageThrowableFunction("image.png")
//}
//catch {}


//try? since try? returns nil or the expected value, you'll need to perform additional checks(if statements) to handle nil values
//do {
//let image = try? loadImageThrowableFunction("image.png")
//}
//catch{}

class Calculator {
    func division(x: Double, y: Double) throws -> Double  {
        if y == 0 {
            throw CalculatorError.divisionByZero
        }
        return x / y
    }
}

let calculator = Calculator()
do {
 
    let successfulResult = try calculator.division(x: 10, y: 5)
    print(successfulResult)
    
    let invalidResult = try calculator.division(x: 10, y: 0)
    print(invalidResult)

} catch CalculatorError.divisionByZero {
    print("Cannot divide by zero")
}
enum CalculatorError: Error {
    case divisionByZero
}


//But did you know that when an error is thrown on a particular line, any code after that line will not be executed?
//Now, what can you do to remedy that? In this reading, you will learn to use a defer statement to execute code in a given code block, no matter what happens.

//A defer statement executes specified statements before the code execution leaves the current block of code.
//The statements provided inside the defer block are executed at the end of a scope, like a function.
//They are executed every time before exiting the scope, even if an error is thrown.

//Note that the defer block is only executed when the current scope is left, which may not be the same as the return from the function.

//The syntax of the defer statement
//A defer statement is declared inside the scope of a given code block, for example, inside a body of a function
func example() {
    defer {
        print("This is the last message")
    }
    
    print("This is the first message")
}

//multiple defer blocks
//If multiple defer statements are defined in a single scope, the order they are defined is the reverse of the order they are executed in.
//This means that the first defer block defined will be executed last.

func printTheNumbers (){
    defer {print("1")}
    defer {print("2")}
    defer {print("3")}
    
    print("4")
}

printTheNumbers()

// USING DEFER WITH "DO CATCH"
//It is sometimes necessary to execute certain code even if an error is thrown. For example, suppose you need to open and read a file’s content.
//let file= open(“file.txt”)
//
//
//do {
//    let result = try readFile(file)
//    
//    file.close()
//} catch {
//    file.close()
//}


// The text file is opened and initialized to a file constant.
// Then the throwable function readFile is called to read its contents inside the do block.
// Notice that in the example, the close function is called in two places –
// first after the successful read of the file, and
// second – inside the catch block in case there is an error and the do block does not complete code execution.
// As repeated code in software development could lead to confusion, it should be minimal.

//This can be optimized using a defer statement:
//let file= open(“file.txt”)
//
//
//do {
//    defer {
//        file.close()
//    }
// 
//    let result = try readFile(file)
//} catch {
//    // Handle errors here
//}
