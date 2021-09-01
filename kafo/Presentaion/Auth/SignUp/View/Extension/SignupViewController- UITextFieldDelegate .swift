//
//  SignupViewController- UITextFieldDelegate .swift
//  kafo
//
//  Created by no one on 30/08/2021.
//

import Foundation
import UIKit
extension SignUpTableViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextFiled.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        mobileNameTextField.resignFirstResponder()
        firstNameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        emailTextFiled.layer.borderWidth = 0
        passwordTextField.layer.borderWidth = 0
        firstNameTextField.layer.borderWidth = 0
        mobileNameTextField.layer.borderWidth = 0
        
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // get the current text, or use an empty string if that failed
        if textField == mobileNameTextField{
        let currentText = textField.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        // make sure the result is under 16 characters
        return updatedText.count <= 8
        }
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
