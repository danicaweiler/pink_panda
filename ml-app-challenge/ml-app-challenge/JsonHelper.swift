//
//  jsonHelper.swift
//  ml-app-challenge
//
//  Created by Danica Weiler on 2021-10-28.
//

import Foundation

func readLocalJSONFile(forName name: String) -> Data? {
    do {
        if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
            let fileUrl = URL(fileURLWithPath: filePath)
            return try Data(contentsOf: fileUrl)
        }
    } catch {
        print("error: \(error)")
    }
    
    return nil
}

func processData<T: Decodable>(_ dta: Data, model: T.Type) throws -> Decodable {
    let decoder = JSONDecoder()
    return try decoder.decode(model, from: dta)
}
