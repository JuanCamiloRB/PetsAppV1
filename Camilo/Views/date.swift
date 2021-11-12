//
//  date.swift
//  Camilo
//
//  Created by Juan C. Rodriguez B on 11/11/21.
//

import UIKit
public enum DateTableType {
    case date
}
class date: UITableViewCell {
    @IBOutlet weak var dateText: UITextField!
    @IBOutlet weak var datelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setStateNormal()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setStateOnFocus()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        setStateNormal()
    }
    
    func setStateNormal() {
        datelbl.textColor = UIColor(red: 63/255, green: 63/255, blue: 63/255, alpha: 0.6)
     
    }
    
    func setStateOnFocus() {
        datelbl.textColor = UIColor(red: 0/255, green: 161/255, blue: 226/255, alpha: 1)
 
    }
    
    func setKeyBoardType(typeCell: DateTableType) {
        
        switch typeCell {
        case .date:
            dateText.keyboardType = .numbersAndPunctuation
       
        }
    }
}
