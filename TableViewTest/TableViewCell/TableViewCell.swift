//
//  TableViewCell.swift
//  TableViewTest
//
//  Created by Komal Gupta on 20/05/21.
//

import UIKit
import IBAnimatable

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblMrp: UILabel!
    @IBOutlet weak var img: AnimatableImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
