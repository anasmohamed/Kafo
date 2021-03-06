//
//  LeftSideMenuViewController.swift
//  kafo
//
//  Created by no one on 08/08/2021.
//

import UIKit
import SideMenu
import FirebaseAuth
class LeftSideMenuViewController: UITableViewController {

    @IBOutlet weak var logoutView: UIView!
    @IBOutlet weak var connectWIthUsView: UIView!
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var ordersView: UIView!
    @IBOutlet weak var homePageView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        connectWIthUsView.layer.cornerRadius = 15
        profileView.layer.cornerRadius = 15
        ordersView.layer.cornerRadius = 15
        homePageView.layer.cornerRadius = 15
        logoutView.layer.cornerRadius = 15
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }
    
    @IBAction func ordersBtnDidTapped(_ sender: Any) {
        navigateToOrdersViewController()
    }
    
    func navigateToServiceViewController() {
        let servicesViewStoryboard = UIStoryboard.init(name: "ServicesView", bundle: nil)
        let servicesViewController = servicesViewStoryboard.instantiateViewController(withIdentifier: "ServicesTableViewController")
//        servicesViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(servicesViewController, animated: true)
    }
    func navigateToLoginViewController() {
        let servicesViewStoryboard = UIStoryboard.init(name: "LoginView", bundle: nil)
        let servicesViewController = servicesViewStoryboard.instantiateViewController(withIdentifier: "LoginViewController")
        servicesViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.present(servicesViewController, animated: true)
    }
    func navigateToOrdersViewController() {
        let servicesViewStoryboard = UIStoryboard.init(name: "MyOrderView", bundle: nil)
        let servicesViewController = servicesViewStoryboard.instantiateViewController(withIdentifier: "MyOrderTableViewController")
        servicesViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(servicesViewController, animated: true)
    }
    
    @IBAction func profileBtnDidTapped(_ sender: Any) {
        let profileViewStoryboard = UIStoryboard(name: "ProfileView", bundle: nil)
        let profileViewController = profileViewStoryboard.instantiateViewController(identifier: "ProfileTableViewController") as! ProfileTableViewController
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    @IBAction func homeBtnDidTapped(_ sender: Any) {
        navigateToServiceViewController()
    }
    
    @IBAction func connectWithUsBtnDidTapped(_ sender: Any) {
        let profileViewStoryboard = UIStoryboard(name: "LeftSideMenuView", bundle: nil)

        let profileViewController = profileViewStoryboard.instantiateViewController(identifier: "ContacWithUsViewController") as! ContacWithUsViewController
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    @IBAction func signoutBrnDidTapped(_ sender: Any) {
        try! Auth.auth().signOut()
        UserDefaults.standard.removeObject(forKey: "email")
        UserDefaults.standard.removeObject (forKey: "firstName")
        UserDefaults.standard.removeObject(forKey: "lastName")
        UserDefaults.standard.removeObject(forKey: "gender")
        UserDefaults.standard.removeObject(forKey: "mobileNumber")
        UserDefaults.standard.removeObject(forKey: "userType")
        UserDefaults.standard.removeObject(forKey: "userId")

        navigateToLoginViewController()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        
        guard let menu = navigationController as? SideMenuNavigationController, menu.blurEffectStyle == nil else {
            return
        }
        tableView.register(UITableViewVibrantCell.self, forCellReuseIdentifier: "UITableViewVibrantCell")
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath) as! UITableViewVibrantCell
        
        if let menu = navigationController as? SideMenuNavigationController {
            cell.blurEffectStyle = menu.blurEffectStyle
        }
        
        return cell
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
