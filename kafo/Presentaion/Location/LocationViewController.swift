//
//  LocationViewController.swift
//  kafo
//
//  Created by no one on 10/07/2021.
//

import UIKit

class LocationViewController: UIViewController {

    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var nearbyLocationBtn: UIButton!
    @IBOutlet weak var cityTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        countryTextField.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor
        countryTextField.layer.borderWidth = 1
        countryTextField.layer.cornerRadius = 8
        cityTextField.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor
        cityTextField.layer.borderWidth = 1
        cityTextField.layer.cornerRadius = 8
        nearbyLocationBtn.layer.borderWidth = 2
        nearbyLocationBtn.layer.cornerRadius = 15

        nearbyLocationBtn.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nearbyLocationBtnDidTapped(_ sender: Any) {
        let locationViewStoryboard = UIStoryboard(name: "ListOfBodyGuards", bundle: nil)
        let locationViewController = locationViewStoryboard.instantiateViewController(identifier: "ListOfBodyGuardsViewController") as! ListOfBodyGuardsViewController
        self.navigationController?.pushViewController(locationViewController, animated: true)
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
