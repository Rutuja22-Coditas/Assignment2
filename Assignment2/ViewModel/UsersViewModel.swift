
import Foundation

class UsersViewModel {
    var gitUser : [User] = []
    var repo_user : [Repo] = []
    //completion : @escaping([User])->(),
    func parseJsonUrl( query : String, completion : @escaping([User])->()){
        let url = "https://api.github.com/search/users?q=\(query)&per_page=20"
        if let url = URL(string: url){
            URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil{
                    do{
                        let SharedUrlSession = try JSONDecoder().decode(Users.self, from: data!)
                        self.gitUser = SharedUrlSession.items
                        completion(SharedUrlSession.items)
                        //print(self.gitUser)
                        }
                    catch{
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    func parseRepoUrl(query : String, completion : @escaping ([Repo])->()){
           let url = "https://api.github.com/users/\(query)/repos"
           if let url = URL(string: url){
               URLSession.shared.dataTask(with: url) { (data, response, error) in
               if error == nil{
                       do{
                        let sharedUrlSession = try JSONDecoder().decode([Repo].self, from: data!)
                        self.repo_user = sharedUrlSession
                        completion(sharedUrlSession)
                        //print("sharedUrlSession",sharedUrlSession)
                        //print(SharedUrlSession[0].name)
                        }
                       catch{
                        print("error",error)
                       }
                   }
               }.resume()
           }
       }

}
