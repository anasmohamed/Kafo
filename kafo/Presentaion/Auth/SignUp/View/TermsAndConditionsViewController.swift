//
//  TermsAndConditionsViewController.swift
//  kafo
//
//  Created by no one on 22/11/2021.
//

import UIKit
import WebKit
class TermsAndConditionsViewController: UIViewController {
    @IBOutlet weak var termsAndConditionsWebView: WKWebView!
    @IBOutlet weak var bsckBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://termsandconditions-1212.web.app/")!
        termsAndConditionsWebView.load(URLRequest(url: url))
        setupRegisterBtn()
        // Do any additional setup after loading the view.
    }
    func setupRegisterBtn()  {
        bsckBtn.layer.cornerRadius = 20
        bsckBtn.layer.borderWidth = 2
        bsckBtn.layer.borderColor = UIColor.yellow.cgColor
    }
    @IBAction func backBtnDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
