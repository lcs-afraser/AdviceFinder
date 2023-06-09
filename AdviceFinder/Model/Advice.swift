//
//  Advice.swift
//  AdviceFinder
//
//  Created by Alistair Fraser on 2023-04-22.
//

import Foundation



struct Advice: Codable {

    var slip: Slip

}

struct Slip: Codable {

    let id: Int

    let advice: String

}
