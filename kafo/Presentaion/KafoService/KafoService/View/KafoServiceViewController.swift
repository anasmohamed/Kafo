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
    
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
         viewShadow(view: personalBodygaurdUIView)
        viewShadow(view: guardingFacilityUIView)
        
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.clickAction(sender:)))
        self.personalBodygaurdUIView.addGestureRecognizer(gesture)
        
        let facilitiesGesture = UITapGestureRecognizer(target: self, action:  #selector(self.facilitiesClickAction(sender:)))
        self.guardingFacilityUIView.addGestureRecognizer(facilitiesGesture)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
    }
    @IBAction func menuBtnDidTapped(_ sender: Any) {
        let leftSideMenuStoryboard = UIStoryboard(name: "LeftSideMenuView", bundle: nil)

        let sideMenuViewController = leftSideMenuStoryboard.instantiateViewController(identifier: "LeftSideMenuNavigationController") as! UINavigationController
        self.present(sideMenuViewController, animated: true)
    }
    @objc func clickAction(sender : UITapGestureRecognizer) {
        // Do what you want
        let bodyguardGenderViewStoryboard = UIStoryboard(name: "BodyguardGenderView", bundle: nil)
        let bodyguardGenderViewController = bodyguardGenderViewStoryboard.instantiateViewController(identifier: "BodyGuardGenderViewController") as! BodyGuardGenderViewController
        bodyguardGenderViewController.user = user
        self.navigationController?.pushViewController(bodyguardGenderViewController, animated: true)
      
    }
    @objc func facilitiesClickAction(sender : UITapGestureRecognizer) {
        // Do what you want
        let facilitiesSccurityApplicationViewStoryboard = UIStoryboard(name: "FacilitiesSccurityApplicationView", bundle: nil)
        let facilitiesSccurityApplicationViewController = facilitiesSccurityApplicationViewStoryboard.instantiateViewController(identifier: "FacilitiesSccurityApplicationViewController") as! FacilitiesSccurityApplicationViewController
        self.navigationController?.pushViewController(facilitiesSccurityApplicationViewController, animated: true)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
