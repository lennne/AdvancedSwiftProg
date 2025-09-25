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


class Person: GoodChef, GreatChef {
    func cookGreatFood() {
        <#code#>
    }
    //In the code above, the Person class adopts and conforms to the second protocol, GreatChef.
    func cookGoodFood() {
        <#code#>
    }
}

//extension is basically adding code to an existing class rather than modifying it(helps follow the solid principle)
extension Person: ExcellentChef {
    func cookExcellentFood() {
        <#code#>
    }
}

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
protocol BlackBeltChef: GoodChef, GreatChef, ExcellentChef {
    func cookBlackBeltFood()
}

class Individual: BlackBeltChef {
    func cookBlackBeltFood() {
        <#code#>
    }
    
    func cookGoodFood() {
        <#code#>
    }
    
    func cookGreatFood() {
        <#code#>
    }
    
    func cookExcellentFood() {
        <#code#>
    }
    
    
}
