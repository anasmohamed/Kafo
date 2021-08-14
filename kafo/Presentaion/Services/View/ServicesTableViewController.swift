//
//  ServicesTableViewController.swift
//  kafo
//
//  Created by no one on 10/07/2021.
//

import UIKit
import SideMenu
class ServicesTableViewController: UITableViewController {
    @IBOutlet weak var compniesServiceView: UIView!
    @IBOutlet weak var kafoServiceView: UIView!
    @IBOutlet weak var instantServiceView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         viewShadow(view: compniesServiceView)
        viewShadow(view: kafoServiceView)
        viewShadow(view: instantServiceView)
        
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        self.instantServiceView.addGestureRecognizer(gesture)
        
        let kafoServicesGesture = UITapGestureRecognizer(target: self, action:  #selector(self.kafoServiceClickAction(sender:)))
        self.kafoServiceView.addGestureRecognizer(kafoServicesGesture)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func clickAction(sender : UITapGestureRecognizer) {
        // Do what you want
        let locationViewStoryboard = UIStoryboard(name: "LocationView", bundle: nil)
        let locationViewController = locationViewStoryboard.instantiateViewController(identifier: "LocationViewController") as! LocationViewController
        self.navigationController?.pushViewController(locationViewController, animated: true)
    }
    @objc func kafoServiceClickAction(sender : UITapGestureRecognizer) {
        // Do what you want
        let kafoServiceViewStoryboard = UIStoryboard(name: "KafoServiceView", bundle: nil)
        let kafoServiceViewController = kafoServiceViewStoryboard.instantiateViewController(identifier: "KafoServiceViewController") as! KafoServiceViewController
        self.navigationController?.pushViewController(kafoServiceViewController, animated: true)
    }
    // MARK: - Table view data source
    func viewShadow(view:UIView)  {
        view.layer.cornerRadius = 7
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOpacity = 0.6
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 10
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
          
        }
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
    @IBAction func menuBtnDidTapped(_ sender: Any) {
        let leftSideMenuStoryboard = UIStoryboard(name: "LeftSideMenuView", bundle: nil)

        let sideMenuViewController = leftSideMenuStoryboard.instantiateViewController(identifier: "LeftSideMenuNavigationController") as! UINavigationController
        self.present(sideMenuViewController, animated: true)
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
