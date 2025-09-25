//
//  SecretFood.swift
//  AdvancedLittleLemon
//
//  Created by Joseph Acquah on 2025-09-23.
//
import Foundation


//In a subclass, you have implementation details like properties and methods of a base class.
//But you don’t always need or want to expose these details to the subclass or places. Access control will help with your code implementation exposure levels.
//you will learn about access control to restrict access to parts of your code from other code.
//You will learn to use access-level modifiers to add different levels of code restrictiveness. Access control works with data types (like class and structure instances), properties, methods, and more.

//Access control and their use cases
//Access control restricts access to parts of your code from different modules and source files.
//A module is defined as a unit of code distribution in Swift. This can be a framework or application.
//When you create a new iOS app project, you create a new module.

// You can technically create a second iOS app module in the same project and import code from the first app module.
// Perhaps you have a pro version with additional features to the original version or a completely different UI while sharing most business logic.

//Access control helps you hide the implementation details. For example, you don’t want the second app to access all the code from the first app.
//Maybe there is logic from the first app that doesn’t apply to the second app.

//Exposing these implementation details makes the second app vulnerable to implementing code that isn’t supposed to be there in the first place.
//Recall that you can hide implementation details between modules, but what about within a module? That is where source files come into play. A source file is a Swift file within a module.

//For example, let's say you create a Restaurant.swift file in the Little Lemon app.
//You can limit the exposure of the Restaurant.swift file to other Swift files within the module.
//Like hiding implementation between modules, you want to limit the places that can read or change implementation details to reduce unexpected behaviors.

//There are five privacy settings. In the order from most to least restrictive, the available access-level modifiers are:

//private - Allows the code within a code definition to access the code.
//fileprivate - Allows the defining source file to access the code.
//internal - Allows source files from the defining module to access the code.
//public - Allows source files from other modules to access the code, however, other modules can’t subclass and override classes.
//open - Allows source files from other modules to access the code. Other modules can subclass and override classes.

//Internal is the default access-level modifier when your code isn’t explicitly assigned one.
//Your code is given an internal access modifier by default. In other words, it is implicitly internal.

// Access-level modifier syntax
//  class ClassIdentifier {
//    [modifier] var number = 1
//}
//
//  class ClassIdentifier {
//    [modifier] func doSomething() {
//    }
//}


//Suppose you’re tasked with creating the menu iOS app project for Little Lemon.
//You create a file called SecretFood.swift.
//In the source file, you create a SecretFood class with a secretIngredients property.
class SecretFood {
 //  private var secretIngredients: [String] = [] // prevents another class using this variable directly(honestly i'll say it just prevents you from using
                                                  // this variable directly as opposed to how it's explained as preventing another class from using the variable directly)
    private var secretIngredients: [String] = []
    
    
    //Suppose you want the Chef class or classes defined in the same source file to have access to read the secret ingredients.
    //You can create a fileprivate method to read the secret ingredients
//    fileprivate func readSecretIngredients() {
//        print("Secret Ingredients")
//        print(secretIngredients)
//    }
//                                            we now change the above from "fileprivate" to "internal"
    
//    When the code is executed, the project successfully compiles without any error.
//    Recall that when the default implicit access-level modifier isn’t explicitly declared, it is internal.
//    You can remove the internal access-level modifier on the readSecretIngredients to make your code more succinct and less wordy:
//        internal func readSecretIngredients() {
        func readSecretIngredients() {
            print("Secret Ingredients")
            print(secretIngredients)
        }
}

//Next, below the SecretFood declaration and in the same source file, you create a Chef class.
//Inside that class, you add the cookSecretFood(_:) method with a secret food parameter.
//Inside the method, you set the secret ingredients of the secret food to an empty array.


 //in general your code is more organized with a class declaration per class

