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
    private var dateOfBirth = ""

    var credentialsInputErrorMessage: Observable<String> = Observable("")
    var isUsernameTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isCityTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isCountryTextFieldHighLighted: Observable<Bool> = Observable(false)

    var isPhoneNumberTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isPrivacyPolicyCheckboxChecked: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var signupSuccess: Observable<User?> = Observable(nil)
//    var saveUserSuccess : Observable<> = Observable(nil)
    //    init() {
    //
    //    }
    //    init(signupManager: SignupManager) {
    //        self.signupManager = signupManager
    //    }
    
    //Here we update our model
    func updateCredentials(firstName: String,lastName:String, password: String, phoneNumber: String,email: String ,userType: String,gender:String,date:String,privacyPolicy:Bool,city:String = "",country:String = "") {
        user.firstName = firstName
        user.lastName = lastName
        user.password = password
        user.email = email
        user.userType = userType
        user.gender = gender
        user.dateOfBirth = date
        privacyPolicyCheckbox = privacyPolicy
        user.city = city
        user.country = country
//        user.isActive = isActive
//        user.deviceToken = deviceToken
        user.mobileNumber = "+973\(phoneNumber)"
//        privacyPolicyCheckbox = isPrivacyPolicyChecked
    }
    
    
    func signup() {
        print("password   \(user.password)")
        signupManager.signupWithEmailAndPassword(email: user.email, password: user.password) { [weak self] (user,error) in
            guard let error = error else {
                self?.signupSuccess.value = self?.user
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
        if !privacyPolicyCheckbox
        {
            errorMessage.value = "the conditons must be agreed first"
            return .Incorrect

        }
//        if userName.isEmpty && password.isEmpty && email.isEmpty && phoneNumber.isEmpty{
//            errorMessage.value = "Please provide username and password."
//            isUsernameTextFieldHighLighted.value = true
//
//            return .Incorrect
//        }
        if user.firstName.isEmpty {
            errorMessage.value = "first name field is empty."
            isUsernameTextFieldHighLighted.value = true
            return .Incorrect
        }
        if user.lastName.isEmpty {
            errorMessage.value = "last name field is empty."
            isUsernameTextFieldHighLighted.value = true
            return .Incorrect
        }
        
        if user.password.isEmpty {
            errorMessage.value = "Password field is empty."
            isPasswordTextFieldHighLighted.value = true
            return .Incorrect
        }
        if user.userType != "client"{
            if user.city.isEmpty{
                errorMessage.value = "City field is empty."
                isCityTextFieldHighLighted.value = true
                return .Incorrect
            }
            if user.country.isEmpty{
                errorMessage.value = "Country field is empty."
                isCountryTextFieldHighLighted.value = true
                return .Incorrect
            }
        }
        if user.email.isEmpty
        {
            errorMessage.value = "Email field is empty."
            isEmailTextFieldHighLighted.value = true
            return .Incorrect
        }
        if user.mobileNumber.isEmpty{

            errorMessage.value = "phone number field is empty."
            isPhoneNumberTextFieldHighLighted.value = true
            return .Incorrect
        }
//        if user.dateOfBirth.isEmpty{
//
//            errorMessage.value = "date of birthfield is empty."
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
