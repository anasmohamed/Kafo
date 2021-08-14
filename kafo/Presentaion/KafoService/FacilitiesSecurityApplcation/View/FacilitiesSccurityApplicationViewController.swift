//
//  FacilitiesSccurityApplicationViewController.swift
//  kafo
//
//  Created by no one on 14/08/2021.
//

import UIKit

class FacilitiesSccurityApplicationViewController: UITableViewController {
    @IBOutlet weak var secondTextField: UITextField!
    
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fifthTextField: UITextField!
    @IBOutlet weak var seventhTextField: UITextField!
    @IBOutlet weak var eighthTextField: UITextField!
    @IBOutlet weak var tenthTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var eleventhTextField: UITextField!
    @IBOutlet weak var ninthTextField: UITextField!
    @IBOutlet weak var thirteenthTextField: UITextField!
    @IBOutlet weak var fitstTextField: UITextField!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var twelvthTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        doneBtn.layer.cornerRadius = 15
        doneBtn.layer.borderColor = UIColor.black.cgColor
        doneBtn.layer.borderWidth = 1
        roundView(view: fitstTextField)
        roundView(view: secondTextField)
        roundView(view: thirdTextField)
        roundView(view: fourthTextField)
        roundView(view: fifthTextField)
        roundView(view: seventhTextField)
        roundView(view: eighthTextField)
        roundView(view: ninthTextField)
        roundView(view: tenthTextField)
        roundView(view: eleventhTextField)
        roundView(view: twelvthTextField)
        roundView(view: thirteenthTextField)

        // Do any additional setup after loading the view.
    }
    func roundView(view:UIView){
        view.backgroundColor = UIColor.clear
        view.layer.cornerRadius = 15
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
    }
    func setGradientBackground() {
      
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 55.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 140.0/255.0, blue:255.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.tableView.bounds
                
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.backgroundView = backgroundView
//        self.tableView.layer.insertSublayer(gradientLayer, at:0)
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
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
