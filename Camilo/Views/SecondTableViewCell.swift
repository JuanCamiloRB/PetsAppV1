//
//  SecondTableViewCell.swift
//  Camilo
//
//  Created by Juan C. Rodriguez B on 10/11/21.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var cirImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    
    @IBOutlet weak var otDescLbl: UILabel!
    @IBOutlet weak var arrowImg: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       
        // Configure the view for the selected state
    }
    
}
