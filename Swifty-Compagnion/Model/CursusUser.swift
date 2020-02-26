//
//  APICursusUsers.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 12/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation

struct Cursus: Decodable {
    let name: String
    let slug: String
    let id: Int
}

struct Skills: Decodable {
    let name: String
    let level: Float
}

struct CursusUser: Decodable {
    let level: Float
    let grade: String?
    let cursus: Cursus
    let skills: [Skills]
}
