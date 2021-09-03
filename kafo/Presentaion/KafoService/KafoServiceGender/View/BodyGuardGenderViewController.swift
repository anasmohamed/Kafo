//
//  BodyGuardGenderViewController.swift
//  kafo
//
//  Created by no one on 12/07/2021.
//

import UIKit

class BodyGuardGenderViewController: UITableViewController {

    @IBOutlet weak var maleUIView: UIView!
    @IBOutlet weak var femaleUIVIew: UIView!
    
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
         viewShadow(view: maleUIView)
        viewShadow(view: femaleUIVIew)
        
        
        let maleGesture = UITapGestureRecognizer(target: self, action:  #selector(self.maleGestureClickAction(sender:)))
        self.maleUIView.addGestureRecognizer(maleGesture)
        
        let femaleGesture = UITapGestureRecognizer(target: self, action:  #selector(self.femaleGestureClickAction(sender:)))
        self.femaleUIVIew.addGestureRecognizer(femaleGesture)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @IBOutlet weak var topView: UIView!
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
    @IBAction func menuBtnDidTapped(_ sender: Any) {
        let leftSideMenuStoryboard = UIStoryboard(name: "LeftSideMenuView", bundle: nil)

        let sideMenuViewController = leftSideMenuStoryboard.instantiateViewController(identifier: "LeftSideMenuNavigationController") as! UINavigationController
        self.present(sideMenuViewController, animated: true)
    }
    @objc func femaleGestureClickAction(sender : UITapGestureRecognizer) {
        // Do what you want
        let numberOfHoursViewStoryboard = UIStoryboard(name: "NumberOfHoursView", bundle: nil)
        let numberOfHoursViewController = numberOfHoursViewStoryboard.instantiateViewController(identifier: "NumberOfHoursViewController") as! NumberOfHoursViewController
        numberOfHoursViewController.isMale = false
        numberOfHoursViewController.user = user

        self.navigationController?.pushViewController(numberOfHoursViewController, animated: true)
    }
    @objc func maleGestureClickAction(sender : UITapGestureRecognizer) {
        // Do what you want
        let numberOfHoursViewStoryboard = UIStoryboard(name: "NumberOfHoursView", bundle: nil)
        let numberOfHoursViewController = numberOfHoursViewStoryboard.instantiateViewController(identifier: "NumberOfHoursViewController") as! NumberOfHoursViewController
        numberOfHoursViewController.isMale = true
        numberOfHoursViewController.user = user
        self.navigationController?.pushViewController(numberOfHoursViewController, animated: true)
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
