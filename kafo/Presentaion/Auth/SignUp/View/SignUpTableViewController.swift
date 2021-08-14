//
//  SignUpTableViewController.swift
//  kafo
//
//  Created by no one on 19/06/2021.
//

import UIKit

class SignUpTableViewController: UITableViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confiremPasswordTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var deteOfBirthTextField: UITextField!
    @IBOutlet weak var mobileNameTextField: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var regiterBtn: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.backgroundView = UIImageView(image: UIImage(named: "background3"))
        setupRegisterBtn()
        let emailImage = UIImage(named:"envelope-3")
        let userImage = UIImage(named:"user-12")
        let callImage = UIImage(named:"call-2")
        let calenderImage = UIImage(named:"calendar")
        let passwordImage = UIImage(named:"padlock")
        
        addLeftImageTo(txtField: emailTextFiled, andImage: emailImage!)
        addLeftImageTo(txtField: passwordTextField, andImage: passwordImage!)
        addLeftImageTo(txtField: confiremPasswordTextField, andImage: passwordImage!)
        addLeftImageTo(txtField: lastNameTextField, andImage: userImage!)
        addLeftImageTo(txtField: firstNameTextField, andImage: userImage!)
        addLeftImageTo(txtField: mobileNameTextField, andImage: callImage!)
        addLeftImageTo(txtField: deteOfBirthTextField, andImage: calenderImage!)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
    }
    func setupRegisterBtn()  {
        regiterBtn.layer.cornerRadius = 20
        regiterBtn.layer.borderWidth = 2
        regiterBtn.layer.borderColor = UIColor.yellow.cgColor
    }
   
    // MARK: - Table view data source
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
          let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
          leftImageView.image = img
          txtField.leftView = leftImageView
          txtField.leftViewMode = .always
      }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
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
}
