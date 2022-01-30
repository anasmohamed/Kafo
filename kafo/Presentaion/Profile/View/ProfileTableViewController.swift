//
//  ProfileTableViewController.swift
//  kafo
//
//  Created by no one on 10/08/2021.
//

import UIKit
import FirebaseDatabase
class ProfileTableViewController: UITableViewController,UITextFieldDelegate {
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var deteOfBirthTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var maleCheckbox: Checkbox!
    @IBOutlet weak var femaleCheckbox: Checkbox!
    @IBOutlet weak var mobileNameTextField: UITextField!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    var token = ""
    let datePicker = UIDatePicker()
    var date : Date? = nil
    var gender = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let emailImage = UIImage(named:"envelope-3")
        let userImage = UIImage(named:"user-12")
        let callImage = UIImage(named:"call-2")
        let calenderImage = UIImage(named:"calendar")
        saveBtn.layer.cornerRadius = 20
        saveBtn.alpha = 0.5
        saveBtn.isEnabled = false
        addLeftImageTo(txtField: emailTextFiled, andImage: emailImage!)
        addLeftImageTo(txtField: lastNameTextField, andImage: userImage!)
        addLeftImageTo(txtField: firstNameTextField, andImage: userImage!)
        addLeftImageTo(txtField: mobileNameTextField, andImage: callImage!)
        addLeftImageTo(txtField: deteOfBirthTextField, andImage: calenderImage!)
        createDatePicker()
        emailTextFiled.delegate = self
        mobileNameTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        deteOfBirthTextField.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        return true
//    }
    @IBAction func menuBtnDidTapped(_ sender: Any) {
        let leftSideMenuStoryboard = UIStoryboard(name: "LeftSideMenuView", bundle: nil)

        let sideMenuViewController = leftSideMenuStoryboard.instantiateViewController(identifier: "LeftSideMenuNavigationController") as! UINavigationController
        
        self.present(sideMenuViewController, animated: true)
    }
     func textFieldDidBeginEditing(_ textField: UITextField) {
//           if textField == emailTextFiled || textField == mobileNameTextField || textField == deteOfBirthTextField || textField == firstNameTextField || textField == lastNameTextField  {
//
//           }
        saveBtn.alpha = 1
        saveBtn.isEnabled = true
       }
    // MARK: - Table view data source
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        firstNameTextField.text = UserDefaults.standard.string(forKey: "firstName")
        lastNameTextField.text = UserDefaults.standard.string(forKey: "lastName")
        emailTextFiled.text = UserDefaults.standard.string(forKey: "email")
        mobileNameTextField.text = UserDefaults.standard.string(forKey: "mobileNumber")
        deteOfBirthTextField.text = UserDefaults.standard.string(forKey: "birthDate")
//        token = UserDefaults.standard.string(forKey: "userId") ?? ""
       
        if UserDefaults.standard.string(forKey: "gender") == "male"{
            maleCheckbox.isChecked = true
        }else{
            femaleCheckbox.isChecked = true
        }
        setGradientBackground() 
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
          let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
          leftImageView.image = img
          txtField.leftView = leftImageView
          txtField.leftViewMode = .always
      }
    func setGradientBackground() {
      
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 55.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 140.0/255.0, blue:255.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.backgroundView = backgroundView
//        self.tableView.layer.insertSublayer(gradientLayer, at:0)
    }
    func createDatePicker()  {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnDidTapped))
        toolBar.setItems([doneBtn], animated: true)
        deteOfBirthTextField.inputAccessoryView = toolBar
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.minimumDate = Date.yesterday

        datePicker.frame.size = CGSize(width: 0, height: 300)
        deteOfBirthTextField.inputView = datePicker
        datePicker.locale = Locale(identifier: "en_US")
        
        datePicker.datePickerMode = .date
    }
    @objc func doneBtnDidTapped()  {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale(identifier: "en_US")
        
        date = datePicker.date
        deteOfBirthTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    @IBAction func onFemaleCheckboxBtnDidTapped(_ sender: Any) {
        maleCheckbox.isChecked = false
        femaleCheckbox.isChecked = true
        gender = "female"
        saveBtn.isEnabled = true
        saveBtn.alpha = 1
    }
    @IBAction func onMaleCheckboxBtnDidTapped(_ sender: Any) {
        maleCheckbox.isChecked = true
        femaleCheckbox.isChecked = false
        gender = "male"
        saveBtn.isEnabled = true
        saveBtn.alpha = 1


    }
    @IBAction func saveBtnDidTapped(_ sender: Any) {
        if !token.isEmpty{
            
        let ref = Database.database().reference().child("Users").child(token)
            var userDict : [String:Any?]?
            userDict = [
                "email":emailTextFiled.text,
                "firstName":firstNameTextField.text,
                "lastName":lastNameTextField.text,
                "gender":gender,
                "dateOfBirth":deteOfBirthTextField.text,
                "mobileNumbr":mobileNameTextField.text]
            ref.updateChildValues(userDict!)

        }}
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
