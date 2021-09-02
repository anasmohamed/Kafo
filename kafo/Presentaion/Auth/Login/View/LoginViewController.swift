//
//  LoginViewController.swift
//  HighWay
//
//  Created by no one on 31/03/2021.
//

import UIKit
import Toast_Swift
class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var createAccountStackView: UIStackView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newUserBtn: UIButton!
    
    var loginViewModel = LoginViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupButton()
        let emailImage = UIImage(named:"envelope-3")
               addLeftImageTo(txtField: emailTextField, andImage: emailImage!)
               
        let passwordImage = UIImage(named:"padlock")
        addLeftImageTo(txtField: passwordTextField, andImage: passwordImage!)
        bindData()
        setDelegates()
//        handeIsUserLogin()
//        self.tabBarController?.tabBar.isHidden = true
//        self.navigationItem.setHidesBackButton(true, animated: true)
//        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
//        createAccountStackView.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        setGradientBackground()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
////        containerView.cornerRadiusAndShodow()
////        self.addKeyboardObserver()
//
//
//    }
    
    @IBAction func newUserBtnDidTapped(_ sender: Any) {
        navigateToSignUpViewController()

//        navigateToMainViewController()
    }
    
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
//        let signupStoryboard = UIStoryboard.init(name: "Signup", bundle: nil)
//        let signupViewController = signupStoryboard.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
//        self.navigationController?.pushViewController(signupViewController, animated: true)
        
        
    }
    
    
    @IBAction func signinBtnDidTapped(_ sender: Any) {
//        navigateToServiceViewController()
        loginViewModel.updateCredentials(email: emailTextField.text!, password: passwordTextField.text!)
        
        switch loginViewModel.credentialsInput() {

        case .Correct:
            login()
        case .Incorrect:
            return
        }
    }
    
    func setupButton()  {
        signInBtn.layer.cornerRadius = 20
        signInBtn.layer.borderWidth = 2
//        signInBtn.layer.borderColor = UIColor.yellow.cgColor
        newUserBtn.layer.cornerRadius = 20
    }
    func handeIsUserLogin()
    {
        if !(UserDefaults.standard.string(forKey: "token")?.isEmpty ?? true){
            navigateToServiceViewController()
        }
    }
  
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage) {
          let leftImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
          leftImageView.image = img
          txtField.leftView = leftImageView
          txtField.leftViewMode = .always
      }

    
    @IBAction func forgetPasswordBtnDidTapped(_ sender: Any) {
      
//        let forgetPasswordStoryboard = UIStoryboard.init(name: "ForgetPassword",bundle: nil)
//        let forgetPasswordViewController = forgetPasswordStoryboard.instantiateViewController(withIdentifier: "ForgetPasswordViewController") as! ForgetPasswordViewController
//        forgetPasswordViewController.modalTransitionStyle = .crossDissolve
//        forgetPasswordViewController.modalPresentationStyle = .overCurrentContext
//        self.present(forgetPasswordViewController,animated:true,completion:nil)
        
        
    }
    
    func bindData() {
        loginViewModel.loginSuccess.bind { [self] in
            guard let email = $0?[1] else { return }
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set($0![0], forKey: "token")
//            navigateToMainViewController()
            navigateToServiceViewController()

        }

        loginViewModel.isEmailTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.emailTextField)!)}
        }

        loginViewModel.isPasswordTextFieldHighLighted.bind { [weak self] in
            if $0 { self?.highlightTextField((self?.passwordTextField)!)}
        }

        loginViewModel.errorMessage.bind {
            guard let errorMessage = $0 else { return }
            var style = ToastStyle()

            // this is just one of many style options
            style.messageColor = .white
            style.backgroundColor = .red
            self.view.makeToast(errorMessage, duration: 3.0, position: .bottom,style:style)
        }
    }
    
    func navigateToMainViewController() {
        let homeViewStoryboard = UIStoryboard.init(name: "MainView", bundle: nil)
        let homeViewController = homeViewStoryboard.instantiateViewController(withIdentifier: "HomeTabBar")
        homeViewController.modalPresentationStyle = .fullScreen
        
        self.present(homeViewController, animated: true, completion: nil)
    }
    func navigateToSignUpViewController() {
        let signupViewStoryboard = UIStoryboard.init(name: "SignUpView", bundle: nil)
        let signupViewController = signupViewStoryboard.instantiateViewController(withIdentifier: "FirstViewController")
        signupViewController.modalPresentationStyle = .fullScreen
        
        self.present(signupViewController, animated: true, completion: nil)
    }
    func navigateToServiceViewController() {
        let servicesViewStoryboard = UIStoryboard.init(name: "ServicesView", bundle: nil)
        let servicesViewController = servicesViewStoryboard.instantiateViewController(withIdentifier: "ServicesTableViewController")
//        servicesViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(servicesViewController, animated: true)
    }
    func login() {
        loginViewModel.login()
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
//
    func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    
    func highlightTextField(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.red.cgColor
        textField.layer.cornerRadius = 3
    }
    
}
