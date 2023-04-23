//
//  Advice.swift
//  AdviceFinder
//
//  Created by Alistair Fraser on 2023-04-22.
//

import Foundation

struct Advice: Codable {
    let id: Int
    let advice: String
}
let exampleAdvice = Advice(id: 30, advice: "When in doubt, just take the next small step.")
