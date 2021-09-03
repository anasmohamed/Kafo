//
//  LocationViewController.swift
//  kafo
//
//  Created by no one on 10/07/2021.
//

import UIKit
import SwiftyMenu
import SnapKit
class LocationViewController: UIViewController {

//    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var nearbyLocationBtn: UIButton!
//    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityDropDownMenu: SwiftyMenu!
    
    @IBOutlet weak var countryDropDownMenu: SwiftyMenu!
    private let dropDownOptionsDataSource = ["الدمام","الرياض"]
    private let countryDropDownOptionsDataSource = ["الضفة","الاندلس","الامل","العقيق"]
    
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        cityDropDownMenu.items = dropDownOptionsDataSource
        cityDropDownMenu.delegate = self
        countryDropDownMenu.items = countryDropDownOptionsDataSource
        countryDropDownMenu.delegate = self
//            countryTextField.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor
//            countryTextField.layer.borderWidth = 1
//            countryTextField.layer.cornerRadius = 8
//        cityTextField.layer.borderColor = UIColor.init(red: 176.0/255.0, green: 173.0/255.0, blue: 108.0/255.0, alpha: 1).cgColor
//        cityTextField.layer.borderWidth = 1
//        cityTextField.layer.cornerRadius = 8
        nearbyLocationBtn.layer.borderWidth = 2
        nearbyLocationBtn.layer.cornerRadius = 15

        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setGradientBackground()
    }
    @IBAction func nearbyLocationBtnDidTapped(_ sender: Any) {
        let locationViewStoryboard = UIStoryboard(name: "ListOfBodyGuards", bundle: nil)
        let locationViewController = locationViewStoryboard.instantiateViewController(identifier: "ListOfBodyGuardsViewController") as! ListOfBodyGuardsViewController
        locationViewController.user = user
        self.navigationController?.pushViewController(locationViewController, animated: true)
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 55.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 140.0/255.0, blue:255.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
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
extension String: SwiftyMenuDisplayable {
    public var retrievableValue: Any {
    return self
    }
    
    public var displayableValue: String {
        return self
    }
    
    public var retrivableValue: Any {
        return self
    }
}
extension LocationViewController: SwiftyMenuDelegate {
    // Get selected option from SwiftyMenu
    func swiftyMenu(_ swiftyMenu: SwiftyMenu, didSelectItem item: SwiftyMenuDisplayable, atIndex index: Int) {
        print("Selected item: \(item), at index: \(index)")
    }
    
    // SwiftyMenu drop down menu will expand
    func swiftyMenu(willExpand swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu willExpand.")
    }

    // SwiftyMenu drop down menu did expand
    func swiftyMenu(didExpand swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu didExpand.")
    }

    // SwiftyMenu drop down menu will collapse
    func swiftyMenu(willCollapse swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu willCollapse.")
    }

    // SwiftyMenu drop down menu did collapse
    func swiftyMenu(didCollapse swiftyMenu: SwiftyMenu) {
        print("SwiftyMenu didCollapse.")
    }
}
