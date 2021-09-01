//
//  SignupFirebaseManager.swift
//  kafo
//
//  Created by no one on 30/08/2021.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth
import Firebase
class SignupManager{
    
    func signupWithEmailAndPassword(email:String,password:String, completionHandler: @escaping ([String]?,Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error as? NSError {
                completionHandler(nil,error)
                
            } else {
                print("User signs up successfully")
                let newUserInfo = Auth.auth().currentUser
                let token = Auth.auth().currentUser?.uid
                let email = newUserInfo?.email
                var user = [String]()
                user.append(token!)
                user.append(email!)
                
                completionHandler(user,nil)
                
            }
            
        }
        
    }
    func sendUserData(user:User)  {
        // 1
        let rootRef = Database.database()
        
        // 2
        let childRef = rootRef.reference(withPath: "Users")
        let userId = childRef.childByAutoId().key
        var userDict : [String:Any?]?
        userDict = [
            "email":user.email,
            "userId":userId,
            "firstName":user.firstName,
            "lastName":user.lastName,
            "password":user.password,
            "userType":user.userType,
            "mobileNumbr":user.mobileNumber]
        
        childRef.child(userId!).setValue(userDict)
    }
    
}
