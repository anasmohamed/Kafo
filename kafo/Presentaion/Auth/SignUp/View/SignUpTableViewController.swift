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
    @IBOutlet weak var regiterBtn: UIButton!
    @IBOutlet weak var emailTextFiled: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundView = UIImageView(image: UIImage(named: "background3"))
        setupRegisterBtn()
        let emailImage = UIImage(named:"envelope-3")
        addLeftImageTo(txtField: emailTextFiled, andImage: emailImage!)
        let userImage = UIImage(named:"user-12")
        let callImage = UIImage(named:"call-2")
        let calenderImage = UIImage(named:"calendar")

        let passwordImage = UIImage(named:"padlock")
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
