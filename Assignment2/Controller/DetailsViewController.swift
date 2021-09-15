
import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    @IBOutlet weak var detailsVCImg: UIImageView!
    @IBOutlet weak var detailsVCNameLbl: UILabel!
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var repoDescriptionLbl: UILabel!
    @IBOutlet weak var repoUrlLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var startDateLbl: UILabel!
    var usersViewModel = UsersViewModel()
    var a = ""
    var repo_url:String = ""
    var name :String = ""
    var image : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        repoUrlLbl.text = repo_url
        detailsVCNameLbl.text = name
        detailsVCImg.kf.setImage(with: URL(string: image))
        
        
        let text = name
        parseRepoUrl(query: text)
            //gitUser = []
//        usersViewModel.parseRepoUrl(query: text) { (data) in
//            self.a = self.description
//        }
            
        }
    func parseRepoUrl(query : String){
           let url = "https://api.github.com/users/\(query)/repos"
           if let url = URL(string: url){
               URLSession.shared.dataTask(with: url) { (data, response, error) in
               if error == nil{
                       do{
                           let SharedUrlSession = try JSONDecoder().decode([Repo].self, from: data!)
   //                        self.description.append(SharedUrlSession.description)
   //                        completion(SharedUrlSession.self)
                       
                        print(SharedUrlSession[0].name)
                        }
                       
                       catch{
                           print(error)
                       }
                   }
               }.resume()
           }
       }
    }
    
   

