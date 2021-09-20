
import UIKit
import Kingfisher

class DetailsViewController: UIViewController {
    @IBOutlet weak var detailsVCImg: UIImageView!
    @IBOutlet weak var detailsVCNameLbl: UILabel!
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var repoDescriptionLbl: UILabel!
    @IBOutlet weak var repoUrlLbl: UILabel!
    @IBOutlet weak var createdOnLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    
    var usersViewModel = UsersViewModel()
    var user:[User]?
    var repoUser : [Repo]?
    var idValue:Int?
    var name : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        details(detail: user![idValue!])
//
        let text = name
        self.usersViewModel.parseRepoUrl(query: text) { (data) in
                self.repoUser = data
            print("repoUser!",self.repoUser!)
            DispatchQueue.main.async {
                self.detail(indexpath: self.idValue!)
            }
            
            //self.repoNameLbl.text = self.repoUser![self.idValue!].name
        }
        
        
        self.detailsVCImg.layer.cornerRadius = self.detailsVCImg.frame.size.width/2
        self.detailsVCImg.clipsToBounds = true
        
        }
    
    func details(detail : User){
        repoUrlLbl.text = detail.repos_url
        detailsVCNameLbl.text = detail.login
        detailsVCImg.kf.setImage(with: URL(string: detail.avatar_url))
    }
    func detail(indexpath:Int){
        languageLbl.text = repoUser![indexpath].language
        repoDescriptionLbl.text = repoUser![indexpath].description
        repoNameLbl.text = repoUser![indexpath].name
        createdOnLbl.text = repoUser![indexpath].created_at
    }

}
    
   

