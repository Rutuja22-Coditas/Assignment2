//
//  User.swift
//  Assignment2
//
//  Created by Coditas on 14/09/21.
//

import Foundation

struct Users: Decodable {
    var items:[User]
    
}

struct User:Decodable {
    var login : String
    var id : Int
    var avatar_url : String
    var url : String
    var repos_url : String
    var score : Float
}
