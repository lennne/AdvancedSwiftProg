import UIKit

var greeting = "Hello, playground"

//as the elements within the set grow, performing different operations on the sets won't slow down a program like an array would.
//Set Declaration
var pastaTypesSet = Set<String>()
var pastaTypesArray = [String]()

//insert values

pastaTypesSet.insert("Tagliatelle")
pastaTypesSet.insert("Fettuccine")
pastaTypesSet.insert("spaghetti")
pastaTypesSet.insert("Linguine")


print(pastaTypesSet)
print(pastaTypesSet.count)

pastaTypesSet.insert("Fettuccine")
print(pastaTypesSet.count)

// The remove function accepts an argument which is the member of your set that should be removed.
// The data type of the argument in the remove function will depend on the data type that the set is created from.

pastaTypesSet.remove("spaghetti")
print(pastaTypesSet.count)

//UNION METHOD
var pastaTypesSet2 = Set<String>()
pastaTypesSet2.insert("Tortellini")
pastaTypesSet2.insert("Ziti")
pastaTypesSet2.insert("Tagliatelle")
pastaTypesSet2.insert("Lasagna")

// To save the newly created combination of sets, you can create a new variable and save the union of the sets to that variable – pastaSetUnion in this case
let pastaSetUnion = pastaTypesSet2.union(pastaTypesSet)
print(pastaSetUnion)
print(pastaSetUnion.count)

//EXERCISE
let reservationsInPerson: Set<String> = ["000-345-3441", "000-345-3442"]
let reservationsOverPhone: Set<String> = ["000-341-2321", "000-123-4314"]
let reservationsOverInternet: Set<String> = ["000-314-3143", "000-134-1523"]

let inPersonAndOverPhone = reservationsInPerson.union(reservationsOverPhone)
print(inPersonAndOverPhone)

var allPhoneNumbers = inPersonAndOverPhone.union(reservationsOverInternet)
print(allPhoneNumbers)

var confirmationCodes: Set<String> = ["LL3450", "LL3451"]

confirmationCodes.insert("LL3452")
confirmationCodes.insert("LL3453")
confirmationCodes.insert("LL3454")
confirmationCodes.insert("LL5523")

print("The number of confirmation Codes is \(confirmationCodes.count) and the number of phoneNumbers is \(allPhoneNumbers.count)")

allPhoneNumbers.remove("000-134-1523")
confirmationCodes.remove("LL5523")

print("The number of confirmation codes and the number of phoneNumbers are \(confirmationCodes.count) and \(allPhoneNumbers.count)")

enum PastaTypes: Int {
    case spaghetti
    case penne
    case ravioli
    case rigatoni
}

print(PastaTypes.penne.rawValue)

enum Week: Int, CaseIterable {
  case Monday
  case Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}

for day in Week.allCases {
  print("\(day) is day \(day.rawValue) of the week")
}
