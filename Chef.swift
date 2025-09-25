//
//  File.swift
//  
//
//  Created by Joseph Acquah on 2025-09-23.
//

import Foundation

class Chef {
//    This demonstrates that the Chef class has access to the SecretFood.readSecretIngredients()  method. The method is only available to the code within the SecretFood.swift source file.
    func cookSecretFood(_ secretFood: inout SecretFood){
        print(secretFood.readSecretIngredients())
    }
}
