//
//  UserTableViewCell.swift
//  Assignment2
//
//  Created by Coditas on 14/09/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var viewDetailsButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func configure(gitUser: User){
//        userName.text = gitUser.login
//        userScore.text = "\(gitUser.score)"
//    }

}
