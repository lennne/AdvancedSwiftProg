import UIKit

var greeting = "Hello, playground"
//encode a class can inherit traits from another class. This is called code inheritance. In practice, it's commonly referred to as sub classing.
//Inheritance describes the sharing of traits between a parent and child class.
//The parent class refers to the existing class, while the new class that inherits all properties and methods from the parent is called a child class.
//In short, code inheritance is a process of subclassing a class from another class.

class Vegetable {
    var Color: String{
            "green"
    }
    func sing () {
        print("I am a vegetable")
    }
}

class Brocolli: Vegetable {
}

class Spinach: Vegetable {
}

class Carrot: Vegetable {
    override var Color: String {
        "Orange"
    }
    
    override func sing() {
        super.sing()
        print("and a carrot at that")
    }
}

let brocolli = Brocolli()
print("\(brocolli.Color)")

let spinach = Spinach()
print("\(spinach.Color)")

let carrot = Carrot()
print("\(carrot.Color)")

brocolli.sing()
spinach.sing()
carrot.sing()


//In a subclass, you have implementation details like properties and methods of a base class.
//But you don’t always need or want to expose these details to the subclass or places. Access control will help with your code implementation exposure levels.
//you will learn about access control to restrict access to parts of your code from other code.
//You will learn to use access-level modifiers to add different levels of code restrictiveness. Access control works with data types (like class and structure instances), properties, methods, and more. 
