//
//  Account.swift
//  ml-app-challenge
//
//  Created by Danica Weiler on 2021-10-28.
//

import Foundation

struct Account: Codable {
    var id: Int
    var display_name: String
    var account_number: String
    var balance: Double // Could be Money
}

extension Account: Equatable {
    public static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.id == rhs.id && lhs.display_name == rhs.display_name && lhs.account_number == rhs.account_number && lhs.balance == rhs.balance
    }
}
