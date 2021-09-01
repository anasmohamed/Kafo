//
//  SignupViewModel.swift
//  kafo
//
//  Created by no one on 30/08/2021.
//

import Foundation
class SignupViewModel {
    private let signupManager  = SignupManager()
    private var user = User(){
        didSet{
            firstName = user.firstName
            lastName = user.lastName
            password = user.password
            email = user.email
        }
    }
    private var firstName = ""
    private var lastName = ""
    private var password = ""
    private var email = ""
    private var phoneNumber = ""
    private var privacyPolicyCheckbox = false
    private var notificationToken = ""
    

    var credentialsInputErrorMessage: Observable<String> = Observable("")
    var isUsernameTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPhoneNumberTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPrivacyPolicyCheckboxChecked: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var signupSuccess: Observable<[String]?> = Observable(nil)
//    var saveUserSuccess : Observable<> = Observable(nil)
    //    init() {
    //
    //    }
    //    init(signupManager: SignupManager) {
    //        self.signupManager = signupManager
    //    }
    
    //Here we update our model
    func updateCredentials(firstName: String,lastName:String, password: String, phoneNumber: String,email: String ,userType: String,gender:String,date:String) {
        user.firstName = firstName
        user.lastName = lastName
        user.password = password
        user.email = email
        user.userType = userType
        user.gender = gender
        user.dateOfBirth = date
//        user.isActive = isActive
//        user.deviceToken = deviceToken
        user.mobileNumber = "+973\(phoneNumber)"
//        privacyPolicyCheckbox = isPrivacyPolicyChecked
    }
    
    
    func signup() {
        print("password   \(user.password)")
        signupManager.signupWithEmailAndPassword(email: user.email, password: user.password) { [weak self] (user,error) in
            guard let error = error else {
                self?.signupSuccess.value = user
                self!.signupManager.sendUserData(user: self!.user)
                return
            }
            
            print(error)
            print(user)
            self?.errorMessage.value = error.localizedDescription
        }
    }
//
//    func isValidEmail(_ email: String) -> Bool {
//        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
//
//        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
//        return emailPred.evaluate(with: email)
//    }
//    func saveUser(userToken:String)  {
//        let user = User(firstName , phoneNumber:phoneNumber , email: email, password:password , isActive:isActive , hasOrder:0 , token:userToken , currentOrder:"" , deviceToken:notificationToken )
//        signupManager.sendUserData(user:user){_,_ in
//
//        }
//    }
    func credentialsInput() -> CredentialsInputStatus {
//        if !privacyPolicyCheckbox
//        {
//            errorMessage.value = "the conditons must be agreed first"
//            return .Incorrect
//
//        }
//        if userName.isEmpty && password.isEmpty && email.isEmpty && phoneNumber.isEmpty{
//            errorMessage.value = "Please provide username and password."
//            isUsernameTextFieldHighLighted.value = true
//
//            return .Incorrect
//        }
//        if firstName.isEmpty {
//            errorMessage.value = "Username field is empty."
//            isUsernameTextFieldHighLighted.value = true
//            return .Incorrect
//        }
//        if password.isEmpty {
//            errorMessage.value = "Password field is empty."
//            isPasswordTextFieldHighLighted.value = true
//            return .Incorrect
//        }
//        if email.isEmpty
//        {
//            errorMessage.value = "Email field is empty."
//            isEmailTextFieldHighLighted.value = true
//            return .Incorrect
//        }
//       b
//        if phoneNumber.isEmpty{
//            
//            errorMessage.value = "phone number field is empty."
//            isPhoneNumberTextFieldHighLighted.value = true
//            return .Incorrect
//        }
      
        return .Correct
    }
}
extension SignupViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}
