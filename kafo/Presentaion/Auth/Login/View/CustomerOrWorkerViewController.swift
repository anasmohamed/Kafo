//
//  CustomerOrWorkerViewController.swift
//  kafo
//
//  Created by no one on 17/06/2021.
//

import UIKit

class CustomerOrWorkerViewController: UIViewController {

    @IBOutlet weak var workerBtn: UIButton!
    @IBOutlet weak var customerBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        workerBtn.layer.cornerRadius = 20
        workerBtn.layer.borderWidth = 2
        workerBtn.layer.borderColor = UIColor.yellow.cgColor
        
        
        customerBtn.layer.cornerRadius = 20
        customerBtn.layer.borderWidth = 2
        customerBtn.layer.borderColor = UIColor.black.cgColor
        // Do any additional setup after loading the view.
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
