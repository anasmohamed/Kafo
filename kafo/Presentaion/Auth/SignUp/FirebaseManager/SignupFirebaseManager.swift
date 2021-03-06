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
    
    func signupWithEmailAndPassword(email:String,password:String, completionHandler: @escaping (Bool?,Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error as? NSError {
                completionHandler(nil,error)
                
            } else {
                print("User signs up successfully")
                let newUserInfo = Auth.auth().currentUser
               
                
                completionHandler(true,nil)
                
            }
            
        }
        
    }
    func sendUserData(user:User)  {
        // 1
        let rootRef = Database.database()
        
        // 2
        let childRef = rootRef.reference(withPath: "Users")
        let userId = Auth.auth().currentUser?.uid
        var userDict : [String:Any?]?
        if user.userType == "client"{
            let childRef = rootRef.reference(withPath: "Users")
            let userId = Auth.auth().currentUser?.uid
        userDict = [
            "email":user.email,
            "fname":user.firstName,
            "lname":user.lastName,
            "password":user.password,
            "date":user.dateOfBirth,
            "city": user.city,
            "country":user.country,
            "phone":user.mobileNumber]
            childRef.child(userId!).setValue(userDict)

        }
        else{
            let childRef = rootRef.reference(withPath: "BdUserBd")
            let userId = Auth.auth().currentUser?.uid
        userDict = [
            "email":user.email,
            "fname":user.firstName,
            "lname":user.lastName,
            "password":user.password,
            "date":user.dateOfBirth,
            "city": user.city,
            "country":user.country,
            "phone":user.mobileNumber]
            childRef.child(userId!).setValue(userDict)

        }

        }
    }
    

