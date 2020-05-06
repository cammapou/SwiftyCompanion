//
//  APIHelper.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 12/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit

typealias APICompletionToken = (_ listUser: Token?, _ errorString: String?) -> Void
typealias APICompletionUser = (_ listUser: User?, _ errorString: String?) -> Void

class APIHelper {
    
    private let _baseUrl = "https://api.intra.42.fr/v2"
    private let _uidClient = "b2ca96e4dfe879f51b3a3105bc55eac9a9a36a4c4671230d0c08db3db4542d75"
    private let secretKey = ""
    
    var urlToken: String {
      return "/oauth/token"
    }
    
    var urlUser: String {
        return "/users/"
    }
    
    var urlCoalitions: String {
        return "/coalitions"
    }
    static let shared = APIHelper()
    private var token: Token?
    
    func getToken(completion: APICompletionToken?){
        let idClient = "grant_type=client_credentials&client_id=" + _uidClient + "&client_secret=" + secretKey
        guard let url = URL(string: "\(_baseUrl)/oauth/token") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = idClient.data(using: .utf8)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion?(nil, error?.localizedDescription)
            }
            if data != nil {
                do {
                    let result = try JSONDecoder().decode(Token.self, from: data!)
                    completion?(result, nil)
                    self.token = result
                } catch {
                    completion?(nil, error.localizedDescription)
                }
            } else {print("❌ No Data \(error!.localizedDescription)")}
        }.resume()
    }
    

    func getUsers(login: String, token: String, completion: APICompletionUser?) {
        guard let url = URL(string: "\(_baseUrl)/users/\(login)") else { completion?(nil, "Error URL"); return}
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion?(nil, error?.localizedDescription)
            }
            if data != nil {
                do {
                    let result = try JSONDecoder().decode(User.self, from: data!)
                    completion?(result, nil)
                } catch {
                    completion?(nil, "Error no data!")
                }
            } else {print("❌ No Data \(error!.localizedDescription)")}
        }.resume()
    }
}
