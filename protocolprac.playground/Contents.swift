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

// RECURSION

@MainActor class Counter {
    var count: Int = 0
    
     func hello(_ count: inout Int) {
        print("hello \(count)")
        count += 1
        if count < 10 {
            hello(&count)
        }
    }
}

let myCounter = Counter()
var start: Int = 0
myCounter.hello(&start)

//Output n numbers to console
//Suppose you have to output numbers from n to 1 in the console.


var n = 6
while n > 0 {
    print(n)
    n-=1
}

// recursive way
func output(n: Int) {
    if (n==0){
        return
    } else {
        print(n)
        output(n: n-1)
    }
}

output(n: 6)


// Another common use case is finding a sum of all numbers in some range.

//Suppose the range, in this case, is from 1 to n.

var m = 6
var sum = 0

while m > 0 {
    sum += m
    m -= 1
}
//
//Implementation becomes a bit more complex with one more variable defined, namely sum. Now instead of a print statement inside the while loop, n is now added to the sum each time.
//
//Let’s now discuss the process of making the implementation recursive using the three-step process again:
//
//Base case: all the numbers from 1 to n have to be summed. Meaning that n has to be reduced by 1 each time until it is equal to 1, after that the algorithm has to stop. In other words, the algorithm must stop when n becomes 0, which will be the base case.
//
//Perform work to reach the base case: in this instance, the work entails summing up the numbers.
//
//Repeat the process: each time creating the sum with a call to the same function reducing n by 1.
//
//The implementation of the algorithm becomes:

//func output(n: Int) -> Int {
//    if(n==0) { // step 1 base case
//        return 0
//    }
//    else {
//        return n + output(n: n - 1) // step 2 and step 3
//    }
//}

// FUNCTIONAL PROGRAMMING
let originalPrices = [2, 5, 6, 12, 5, 20]

func priceConversion(originalPrices: [Int], conversionClosure: (_ price: Int) -> Int) -> [Int] {
    var convertedPrices = [Int]()
    for originalPrice in originalPrices {
        let convertedPrice = conversionClosure(originalPrice)
        convertedPrices.append(convertedPrice)
    }
    
    return convertedPrices
}

// $0 → refers to the first argument passed into the closure.
// { (value: Int) -> Int in
//        return value * 2
// }
priceConversion(originalPrices: originalPrices, conversionClosure: {$0 * 2})

// higher order functions that swift provides for working with collections
//map to transform each item in the collection into a different one. Filter to remove certain elements from an array for a given condition.
//Reduce to return a single accumulated value using all the values from the array.
//These functions use closures to enable you to pass on functionality and describe how the data should be transformed.

//MAPPING FUNCTIONALITY
// The map function is very convenient in this scenario.
// It can take a closure that transforms each element of an array to the string, producing a new array containing numbers in string format.
let numbersArray: [Int] = [1, 2,3,4,5,6]
let numbersAsStrings = numbersArray.map { (aNumber) -> String in
        return String(aNumber)
}

print(numbersAsStrings)

//short hand version using shorthand argument names
// let numbersAsStrings = numbersArray.map { String $0 }

//FILTER FUNCTIONALITY
// The filter function is best used when you only need to do something with the elements in an array that pass a certain condition.
// The closure of the filter method determines if an object will be added or left out of the resulting array by checking the condition in this case if
// a number is greater than 4
let onlySmallNumbers = numbersArray.filter{ (aNumber) -> Bool in
    return aNumber > 4
}
print(onlySmallNumbers)

let maybeSmall = numbersArray.filter{ $0 > 3 }
print(maybeSmall)

// reduce functionality allows you to define and use a variable for some particular purpose through the whole iteration process,
// whether you want to sum up values, concatenate strings, add values etc
let totalValueFrom4 = numbersArray.reduce(0){ results, current -> Int in
        return results + current
}

// MAP, FILTER AND REDUCE EXAMPLES
// MAP
struct User {
    let id: Int
    let name: String
}

let users = [
    User(id: 1, name: "John"),
    User(id: 2, name: "Tom")
]

// Given a struct representing user information and a constant holding an array of user objects,
// it is possible to convert the user's array to an array containing users` ids.
// Basically what we mean by conver to another array, is we're taking the existing elements and converting each to something else,
// and then the now new values come together to form an array
let userIds = users.map{ user in
    return user.id
}
// so in the above code what we get is an array of Ids
print(userIds)

// The shorter version of the map closure would be using a $0 default parameter representing the user instead of
// defining an explicit user constant in closure as follows:
 let shortUsersIds = users.map { $0.id }

// COMPACT MAP
// compactMap is a special type of map that discards any nil values.
// It is very useful if an object conversion function could produce nil.  In this case, however, you only want the non-nil values in the resulting array.

let urlsAsStrings = ["https://www.google.com", "not a valid url"]
let urlsOrNil = urlsAsStrings.map { URL(string: $0) }
let urls = urlsAsStrings.compactMap { URL(string: $0) }
print("mixed \(urlsOrNil) and valid urls \(urls)")


// FLAT MAP
struct Speaker {
    let id: Int
    let name: String
    let languages: [String]
}

let speakers = [
    Speaker(id: 1, name: "John", languages: ["English", "German"]),
    Speaker(id: 2, name: "Tom", languages: ["Russian", "Spanish"])
]

let allLanguages = speakers.flatMap{$0.languages}
print(allLanguages)


//EXERCISE WITHOUT SHORTHAND
struct Order {
    let price:Int
    let location: String
}
//
//func totalRevenueOf(orders: [Order], location: String) -> Int {
//    let ordersAtLocation = orders.filter{ current in
//        return location == current.location
//    }
//    
//    let total = ordersAtLocation.reduce(into: 0){ oldValue, current in
//        oldValue = oldValue + current.price
//    }
//    return total
//}
//
let orders = [
    Order(price: 24, location: "New York"),
    Order(price: 37, location: "San Francisco"),
    Order(price: 101, location: "New York"),
]
//
//let result = totalRevenueOf(orders: orders, location: "New York")
//print("the total value is \(result)")

func totalRevenueOf(orders: [Order], location: String) -> Int {
    let ordersAtLocation = orders.filter{$0.location == location}
    print(ordersAtLocation)
    let orderPrices = ordersAtLocation.map{$0.price}
    print(orderPrices)
    let totalRevenueOf = orderPrices.reduce(0){$0 + $1}
    return totalRevenueOf
}


print(totalRevenueOf(orders: orders, location: "New York"))
