

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
struct RepoList: Decodable{
    var itemsInRepo : [Repo]
}
struct Repo:Decodable{
    var name : String?
    var description : String?
    var language : String?
    var created_at : String?
    
}
