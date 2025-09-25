//
//  Chef.swift
//  AdvancedLittleLemon
//
//  Created by Joseph Acquah on 2025-09-23.
//


class Chef {
//    This demonstrates that the Chef class has access to the SecretFood.readSecretIngredients()  method. The method is only available to the code within the SecretFood.swift source file.
    func cookSecretFood(_ secretFood: inout SecretFood){
        print(secretFood.readSecretIngredients()) //Because the Chef class is in another file, the readSecretIngredients method marked as fileprivate is no longer accessible. 
    }
}
