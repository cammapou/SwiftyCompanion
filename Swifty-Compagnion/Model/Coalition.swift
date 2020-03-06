//
//  Coalition.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 12/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation

struct Coalition: Decodable {
    let id: Int
    let name: String
    let slug: String
    let image_url: URL
    let color: String
    
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug, image_url, color
    }
}
