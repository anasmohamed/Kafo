//
//  KafoServiceViewController.swift
//  kafo
//
//  Created by no one on 12/07/2021.
//

import UIKit

class KafoServiceViewController: UITableViewController {

    @IBOutlet weak var personalBodygaurdUIView: UIView!
    @IBOutlet weak var guardingFacilityUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         viewShadow(view: personalBodygaurdUIView)
        viewShadow(view: guardingFacilityUIView)
        
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        self.personalBodygaurdUIView.addGestureRecognizer(gesture)
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
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
