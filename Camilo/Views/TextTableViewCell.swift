//
//  TextTableViewCell.swift
//  Camilo
//
//  Created by Juan C. Rodriguez B on 11/11/21.
//

import UIKit
public enum OptionTableType {
    case email
}
class TextTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var keyLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        textField.delegate = self
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
        keyLabel.textColor = UIColor(red: 63/255, green: 63/255, blue: 63/255, alpha: 0.6)
     
    }
    
    func setStateOnFocus() {
        keyLabel.textColor = UIColor(red: 0/255, green: 161/255, blue: 226/255, alpha: 1)
 
    }
    
    func setKeyBoardType(typeCell: OptionTableType) {
        
        switch typeCell {
        case .email:
            textField.keyboardType = .emailAddress
       
        }
    }
    
}
