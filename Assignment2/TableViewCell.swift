//
//  TableViewCell.swift
//  Assignment2
//
//  Created by Coditas on 07/10/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var labelIcon: UIImageView!
    @IBOutlet weak var celTitle: UILabel!
    @IBOutlet weak var cellData: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
