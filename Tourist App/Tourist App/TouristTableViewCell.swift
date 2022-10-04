//
//  TouristTableViewCell.swift
//  Tourist App
//
//  Created by Runyao Xia on 10/3/22.
//

import UIKit

class TouristTableViewCell: UITableViewCell {

    @IBOutlet weak var imgTourist: UIImageView!
    
    @IBOutlet weak var labelTourist: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
