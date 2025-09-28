//
//  AdvancedLittleLemonTests.swift
//  AdvancedLittleLemonTests
//
//  Created by Joseph Acquah on 2025-09-23.
//

import Foundation
import XCTest
@testable import AdvancedLittleLemon

final class AdvancedLittleLemonTests: XCTestCase {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        func test_IncreaseRecipeCount_RecipeCountIsOne() {
            let recipe = Recipe()
            XCTAssert(recipe.duration == 0)
    }
    
    func test_recipeDurationCount_incremenetDuration_durationCountEqualsOne(){
        var recipe = Recipe()
        recipe.incrementTimer()
        XCTAssert(recipe.duration == 1)
    }
    
//    Fake is an object that has implementations that replicate the behavior of an original class but in a much simpler manner.
//    Meaning, when the code being tested depends on other objects, those can be substituted with fake objects
//    mimicking their behavior to put a testable piece of code in a certain scenario.

//    Fake objects are usually used to avoid complex configurations or time-consuming operations that take long during a unit test.
//    Consider a scenario where user data is received from the server and displayed on-screen. When verifying that data is displayed
//    correctly on the screen, you would load the fake user data from disk rather than waiting for it to be downloaded, because the
//    load of the data is not the main test – it is data displaying on-screen correctly.

//     So, by separating important logic from unimportant logic, the later code can be substituted by the
//    fake objects to save time when running a test.
    
    
//    The Little Lemon restaurant mobile application gets meal information from the server and then displays it on the screen.
//    Suppose you are tasked with implementing a unit test for the following implementation of the above requirements:
    
    protocol NetworkManager{
        func getMealsList() -> [String]
    }
    
    class MenuManager {
        let networkManager: NetworkManager
        
        init(networkManager: NetworkManager){
            self.networkManager = networkManager
        }
        
        func allMeals() -> String {
            return networkManager.getMealsList().joined(separator: ",")
        }
    }
    
//    Firstly, the code imports Foundation framework to be able to use core Swift types, and XCTest framework to be able to access testing classes and methods.

//    Then, the NetworkManager protocol is defined and has a single method called getMealsList that returns a list of meal names from the server. This is used by the class named MenuManager which can be initialized with an instance of the NetworkManager. Lastly, the class has a method named allMeals that calls the NetworkManager instance and returns the list of all the meals that server sent.

//    So by now, it is clear that when the allMeals method is called on the MenuManager class instance, the following call to the getMealsList function is done on the NetworkManager object inside the class. Then the result provides a list of all the meals as a string separated by commas.

//    To test the allMeals method would require that you wait for a server response each time. Using a fake, you can surpass that process.
    
    // FAKE NETWORKMANAGER IMPLEMENTATION
//    The real NetworkManager implementation queries the server for the list of the meals and waits for the response.
//    To save time, the following fake implementation can be created that returns a predefined list of local meals items as follows:
    
    class fakeNetworkManager: NetworkManager {
        func getMealsList() -> [String] {
            return ["Soda", "Milkshake"]
        }
    }
    
    func test_allMeals_getAllMeals_MealsAreEqual(){
        let menu = MenuManager(networkManager: fakeNetworkManager())
        let allMeals = menu.allMeals()
        XCTAssertEqual(allMeals, "Soda,Milkshake")
    }
    
//    When implementing a unit test, the menu constant is first initialized with the MenuManager instance which gets a fake network manager
//    instance as an argument. Secondly, allMeals constant is initialized by calling the allMeals function on the menu constant. Finally,
//    XCTAssertEqual is used to confirm that the result of the function call is equal to what is expected, which is a string with a list inside it.

//    In the scenario, testing of the allMeals function is simplified by using a fake and not waiting for server interactions but returning local data instead.
    
    //MOCKS
//    A mock is like a fake in a way that the real object is replaced with a simplified version of the complex code.
//    But the difference between a fake and a mock is that a mock also tracks how many times a method is called
//    and what parameters were used while calling the method.
    
//    Like a fake, a mock can be used to simplify the complexity of objects that the code being tested depends on.
//    In addition to this, a mock can verify that a particular function of the mocked object has been called with the correct parameters.
    protocol NetworkNewsletter {
        func createNewsletterSubscription(email: String)
    }
    
    class NewsletterManager{
        let networkNewsletter: NetworkNewsletter
        init(networkNewsletter: NetworkNewsletter){
            self.networkNewsletter = networkNewsletter
        }
        
        func subscribe(email: String){
            networkNewsletter.createNewsletterSubscription(email: email)
        }
    }
    
//    Firstly, the code imports Foundation framework to be able to use core Swift types, and XCTest framework to be able to access testing classes and methods.

//    Then the NetworkManager protocol is defined, having a single method called createNewsletterSubscription definition
//    which can get a string representing an email as its argument.
//    Then, a class named NewsletterManager is defined. That takes an instance of NetworkManager implementation when initializing the class.
//    It also has a method named subscribe that takes an email as a string and calls the network manager
//    createNewsletterSubscription function to register an email to get monthly newsletters.

//    Suppose you want to test that when subscribing a customer to the newsletters, the call to the NetworkManager
//    is done only once per subscription and with the correct email address. How would you do that? The answer is; using a mock.
    class MockNetworkManager: NetworkNewsletter {
        var howManyTimesFunctionWasCalled = 0
        var emailTheFunctionReceeived = ""
        
        func createNewsletterSubscription(email: String){
            howManyTimesFunctionWasCalled += 1
            emailTheFunctionReceeived = email
        }
    }
    
    func test_subscribeNewsletter_NumberOfTimesCalledParametersReceived(){
        let mockNetworkManager = MockNetworkManager()
        let newsletter = NewsletterManager(networkNewsletter: mockNetworkManager)
        let email = "example@gmail.com"
        newsletter.subscribe(email: email)
        XCTAssertEqual(mockNetworkManager.howManyTimesFunctionWasCalled, 1)
        XCTAssertEqual(mockNetworkManager.emailTheFunctionReceeived, email)
    }
    
//    When implementing a unit test first, the MockNetworkManager class is initialized to a constant. Then, it is used to initialize the real NewsletterManager class which method will be tested. Then the test example email is defined and the subscribe function is called using the example email constant.

//    Finally, XCTAssertEqual can be used to verify that the mocked network manager class has recorded the correct data, meaning – the function to create the subscription should have been called only once, and the correct email should have been used.
    
    func test_calculateTotal_salesTaxTwentyPercent() {
        let items = [
            CheckoutItem(name: "Fish and Chips", price: 625),
            CheckoutItem(name: "peanuts", price: 20),
            CheckoutItem(name: "rice", price: 102),
            CheckoutItem(name: "Chicken", price: 50),
        ]
        
        let taxPercentage: Int = 20
        let totalToPay = calculateTotal(items: items, localTaxPercent: taxPercentage)
        XCTAssertEqual(totalToPay, 2370)
    }
}
