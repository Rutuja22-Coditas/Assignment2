
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
    var repo_url:String = ""
    var name :String = ""
    var image : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        repoUrlLbl.text = repo_url
        detailsVCNameLbl.text = name
        detailsVCImg.kf.setImage(with: URL(string: image))
        
    }
    
   
}
