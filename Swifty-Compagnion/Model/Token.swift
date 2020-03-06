//
//  Token.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 12/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation


struct Token: Decodable {
    var token: String
    
    init(token: String) {
        self.token = token
    }
    
    enum CodingKeys: String, CodingKey {
        case token = "access_token"
    }
}
