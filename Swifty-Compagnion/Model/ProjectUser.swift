//
//  APIProjectUser.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 12/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation

struct Project: Decodable {
    let name: String
    let slug: String
    let parent_id: Int?
}

struct ProjectsUser: Decodable {
    let final_mark: Int?
    let status: String
    let validated: Bool?
    let project: Project
    let cursus_ids : [Int]
    
    enum CodingKeys: String, CodingKey {
        case final_mark
        case status
        case validated = "validated?"
        case project
        case cursus_ids
    }
}

