import UIKit

var greeting = "Hello, playground"

//enums are commonly used to group related code into a single definition
//lets you collect a set of closely related values or states under one named type instead of scattering them across your code.

//Basic enums
enum CookingTypes {
    case Steaming
    case Boiling
    case Grilling
    case Frying
}

print(CookingTypes.Grilling)

// Attaching raw values
enum Directions: Int {
    case north = 90
    case south = 270
    case west = 180
    case east = 360
}

print(Directions.north) //this should display 90
let cookingTime = Directions.north.rawValue
print("This is the value \(cookingTime)")

//Passing enums inside functions
func findDirection(finalDirection: Directions){
    let myDirection = finalDirection.rawValue //because when you're passing a value in, you'll pass in the case of the enum
    print("The direction is \(finalDirection)")
}

//function call
findDirection(finalDirection: Directions.north)

// CASEITERABLE PROTOCOL
//case iterable allow you to iterate over enums
enum PastaTypes: Int, CaseIterable {
    case spaghetti
    case pennne
    case ravioli
    case rigatoni
}

// Conforming to the CaseIterable enables you to use the allCases property. This property is essentially a regular array and can be used to check the total enum cases
let totalCaseCount = PastaTypes.allCases.count
print("number of cases \(totalCaseCount)")


//ASSOCIATED VALUES
enum DirectionsOther {
    case NorthEast(angle: Int)
    case NorthWest(angle: Int)
    case SouthEast(angle: Int)
    case SouthWest(angle: Int)
}

var checkDirection = DirectionsOther.NorthEast(angle: 135)
print("the checkDirection value is \(checkDirection)")

var newDirection = DirectionsOther.NorthEast(angle: 135)

func checkIfDirected(for myDirection: DirectionsOther){
    switch myDirection {
        //the case in the switch statement
        case .NorthEast(let angle):
            if angle > 135 {
                print("Angle is \(angle) and it is greater")
            } else {
                print("Angle is \(angle) and it is lesser")
            } // ends here
        
        default: return
    }
}

//calling the function
checkIfDirected(for: DirectionsOther.NorthEast(angle: 150)) // in this scenario we use a lot of "if" and "else" statements

// we can also use "where"
enum Positions {
    case Striker(playerName: String)
    case Midfielder(playerName: String)
    case Defender(playerName: String)
}

func findPlayer(plays myPlayer: Positions){
    switch myPlayer {
        case .Defender(let player) where player == "Puyol":
            print("The player is \(player) and he plays Defense")
        default: return
    }
}


findPlayer(plays: Positions.Defender(playerName: "Puyol"))
//The function receives the same arguments as the one created before and switches on the enum case too. The only difference is that the where keyword checks the condition.

//EXERCISE
// Represent ingredients of a meal
// enum declaration
enum Ingredient: String {
    case chicken = "Thigh Chicken"
    case lettuce = "Romaine Lettuce"
    case tomato = "Roma Tomato"
}

let ingredient = Ingredient.chicken

switch ingredient {
case .chicken:
    print("This is a chicken of type \(ingredient.rawValue)")
case .lettuce:
    print("This is a lettuce of type \(ingredient.rawValue)")
case .tomato:
    print("This is a tomato of type \(ingredient.rawValue)")
}

enum RecipeInformation{
    case allergens(information: String)
}

let recipeInformation = RecipeInformation.allergens(information: "peanuts milk gluten")

switch recipeInformation {
case .allergens(let information):
    print("The allergens are \(information)")
}
