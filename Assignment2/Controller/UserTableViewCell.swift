

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userScore: UILabel!
    @IBAction func viewDetailsButtonPressed(_ sender: Any) {
        tapBlock?()
    }
    
    var tapBlock: (() -> Void)? = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userImg.layer.cornerRadius = self.userImg.frame.size.width/2
        self.userImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}
