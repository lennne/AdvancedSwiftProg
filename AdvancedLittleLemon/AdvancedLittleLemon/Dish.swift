//
//  Dish.swift
//  AdvancedLittleLemon
//
//  Created by Joseph Acquah on 2025-09-25.
//

class Dish {
    let ingredients: String
    let name: String
    
    init(name: String, ingredients: String){
        self.ingredients = ingredients
        self.name = name
    }
    
    func printInfo() {
        print("\(name) \(ingredients)")
    }
    
}

final class AppetizerDish: Dish {
    
    override func printInfo(){
        print("Appetizer")
        super.printInfo()
        
    }
}

final class MainDish: Dish {
    
}
