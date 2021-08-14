//
//  NumberOfHoursViewController.swift
//  kafo
//
//  Created by no one on 12/07/2021.
//

import UIKit

class NumberOfHoursViewController: UIViewController {

    @IBOutlet weak var checkoutBtn: UIButton!
    @IBOutlet weak var bodygaurdPhoto: UIImageView!
    @IBOutlet weak var enterNumberOfBodyGuardsLbl: UILabel!
    @IBOutlet weak var numberOfHoursTextField: UITextField!
    var isMale = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isMale{
            bodygaurdPhoto.image = UIImage(named: "male")
            enterNumberOfBodyGuardsLbl.text = "ادخل عدد الحراس"
        }else{
            bodygaurdPhoto.image = UIImage(named: "women")
            enterNumberOfBodyGuardsLbl.text = "ادخل عدد الحراسات"

        }
        numberOfHoursTextField.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor
        numberOfHoursTextField.layer.borderWidth = 1
        numberOfHoursTextField.layer.cornerRadius = 8
        
        checkoutBtn.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor
        checkoutBtn.layer.borderWidth = 2
        checkoutBtn.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
