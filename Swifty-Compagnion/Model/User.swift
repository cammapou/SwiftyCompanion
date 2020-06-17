//
//  APIData.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 12/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation



struct User: Decodable {
    let id: Int
    let login: String
    let displayname: String
    let email: String
    let phone: String?
    var imageUrl: URL
    let location: String?
    let correctionPoints: Int
    let wallet: Int
    let cursusUser: [CursusUser]
    let projectsUser: [ProjectsUser]
    
    /* L'association entre le nom de cas et sa valeur brute vous permet de nommer vos structures de données conformément aux directives de conception de l'API Swift plutôt que d'avoir à faire correspondre les noms, la ponctuation et la capitalisation du format de sérialisation que vous modélisez. CodingKeys */
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case displayname
        case email
        case phone
        case imageUrl = "image_url"
        case location
        case correctionPoints = "correction_point"
        case wallet
        case cursusUser = "cursus_users"
        case projectsUser = "projects_users"
    }
}

