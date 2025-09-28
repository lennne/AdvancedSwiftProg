//
//  Checkout.swift
//  AdvancedLittleLemon
//
//  Created by Joseph Acquah on 2025-09-26.
//

struct CheckoutItem {
    let name: String
    let price: Int
}

func calculateTotal(items: [CheckoutItem], localTaxPercent: Int) -> Int {
    let itemsTotal = items.reduce(0) {$0 + $1.price}
    let taxAmount = itemsTotal * localTaxPercent / 100
    return itemsTotal + taxAmount
}
