//
//  Activity.swift
//  ml-app-challenge
//
//  Created by Danica Weiler on 2021-10-28.
//

import Foundation

struct Activity: Codable {
    var id: Int
    var date: String //String for simplicity sake would need ot be a proper Date
    var description: String
    var deposit_amount: Double?
    var withdrawal_amount: Double?
    var balance: Double
    var transaction_uid: Int //Int for simplicity sake, should be UUID
}
