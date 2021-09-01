//
//  FirstViewController.swift
//  kafo
//
//  Created by no one on 11/08/2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var clientBtn: UIButton!
    @IBOutlet weak var securityBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        clientBtn.layer.cornerRadius = 20
        clientBtn.layer.borderWidth = 2
        clientBtn.layer.borderColor = UIColor.black.cgColor
        
        securityBtn.layer.cornerRadius = 20
        securityBtn.layer.borderWidth = 2
        securityBtn.layer.borderColor = UIColor.black.cgColor
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setGradientBackground()
    }
    
    @IBAction func securityBtnDidTapped(_ sender: Any) {
        navigateToSecondViewController()
        
    }
    
    @IBAction func clientBtnDidTapped(_ sender: Any) {
        navigateToSignUpViewController()
        
    }
    func navigateToSecondViewController() {
        let signupViewStoryboard = UIStoryboard.init(name: "SignUpView", bundle: nil)
        let signupViewController = signupViewStoryboard.instantiateViewController(withIdentifier: "SecondViewController")
        signupViewController.modalPresentationStyle = .fullScreen
        
        self.present(signupViewController, animated: true, completion: nil)
    }
    func navigateToSignUpViewController() {
        let signupViewStoryboard = UIStoryboard.init(name: "SignUpView", bundle: nil)
        let signupViewController = signupViewStoryboard.instantiateViewController(withIdentifier: "SignUpTableViewController") as! SignUpTableViewController
        signupViewController.modalPresentationStyle = .fullScreen
        signupViewController.userType = "client"
        self.present(signupViewController, animated: true, completion: nil)
    }
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 55.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 140.0/255.0, blue:255.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
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
