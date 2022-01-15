//
//  LoginFirebaseManager.swift
//  kafo
//
//  Created by no one on 02/09/2021.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
class LoginManager {
    func loginWithCredentials(email:String,password:String, completionHandler: @escaping (User?,Error?) -> Void) {
        let userRef = Database.database().reference(withPath: "Users")
        let bodyguardRef = Database.database().reference(withPath: "BdUserBd")

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error as? NSError {
                completionHandler(nil,error)
                
            } else {
                print("User signs up successfully")
                let newUserInfo = authResult?.user
                let token = newUserInfo?.uid
                print(token)
                let user = User()
                bodyguardRef.child(token!).observeSingleEvent(of: .value, with: {(snapshot) in
                    //                print(snapshot)
                    if snapshot.exists() {
                    let userDict = snapshot.value as! [String: Any]
                        UserDefaults.standard.setValue("bodyguard", forKey: "userType")

                    let email = userDict["email"] as? String
                    let firstName = userDict["fName"] as? String
                    let lastName = userDict["lName"] as? String
                    let dateOfBirth = userDict["dateOfBirth"] as? String
                    let gender = userDict["gender"] as? String
                    let mobileNumbr = userDict["phone"] as? String
//                    let userType = userDict["userType"] as? String
//                    let userId = userDict["userId"] as? String
                    
                    user.email = email ?? ""
                    user.firstName = firstName ?? ""
                    user.lastName = lastName ?? ""
                    user.dateOfBirth = dateOfBirth ?? ""
                    user.gender = gender ?? ""
                        user.userType = "bodyguard"
                    user.mobileNumber = mobileNumbr ?? ""
//                    user.userType = userType ?? ""
//                    user.token = userId ?? ""
                    completionHandler(user,nil)
                    }else{
                        userRef.child(token!).observeSingleEvent(of: .value, with: {(snapshot) in
                            //                print(snapshot)
                            let userDict = snapshot.value as! [String: Any]
                            UserDefaults.standard.setValue("client", forKey: "userType")
                            let email = userDict["email"] as? String
                            let firstName = userDict["fName"] as? String
                            let lastName = userDict["lName"] as? String
                            let dateOfBirth = userDict["dateOfBirth"] as? String
                            let gender = userDict["gender"] as? String
                            let mobileNumbr = userDict["phone"] as? String
        //                    let userType = userDict["userType"] as? String
        //                    let userId = userDict["userId"] as? String
                            
                            user.email = email ?? ""
                            user.firstName = firstName ?? ""
                            user.lastName = lastName ?? ""
                            user.dateOfBirth = dateOfBirth ?? ""
                            user.gender = gender ?? ""
                            user.mobileNumber = mobileNumbr ?? ""
        //                    user.userType = userType ?? ""
        //                    user.token = userId ?? ""
                            completionHandler(user,nil)

                        })
                    }
                })
                
               
                
            }
        }
        
    }
}
