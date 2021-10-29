//
//  Transaction.swift
//  ml-app-challenge
//
//  Created by Danica Weiler on 2021-10-28.
//

import Foundation

struct Transaction: Codable {
    var date: String //String for simplicity sake should be Date
    var activity: [Activity]
}
