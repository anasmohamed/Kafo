//
//  LoginViewModel.swift
//  kafo
//
//  Created by no one on 02/09/2021.
//

import Foundation

class LoginViewModel {
    private let loginManager  = LoginManager()
    private var user = User(){
        didSet{
          
            password = user.password
            email = user.email
        }
    }
 
    private var password = ""
    private var email = ""
  

    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var loginSuccess: Observable<[String]?> = Observable(nil)

    
    //Here we update our model
    func updateCredentials(email: String ,password: String) {
       
        user.password = password
        user.email = email
      
    }
    
    
    func login() {
        print("password   \(user.password)")
        loginManager.loginWithCredentials(email: user.email, password: user.password) { [weak self] (user,error) in
            guard let error = error else {
                self?.loginSuccess.value = user
//                self!.signupManager.sendUserData(user: self!.user)
                return
            }
            
            print(error)
            print(user)
            self?.errorMessage.value = error.localizedDescription
        }
    }

    func credentialsInput() -> CredentialsInputStatus {
       

        
        if user.password.isEmpty {
            errorMessage.value = "Password field is empty."
            isPasswordTextFieldHighLighted.value = true
            return .Incorrect
        }
        if user.email.isEmpty
        {
            errorMessage.value = "Email field is empty."
            isEmailTextFieldHighLighted.value = true
            return .Incorrect
        }

        return .Correct
    }
}
extension LoginViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}
