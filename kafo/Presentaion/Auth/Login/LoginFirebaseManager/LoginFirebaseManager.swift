//
//  LoginFirebaseManager.swift
//  kafo
//
//  Created by no one on 02/09/2021.
//

import Foundation
import FirebaseAuth
class LoginManager {
    func loginWithCredentials(email:String,password:String, completionHandler: @escaping ([String]?,Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error as? NSError {
                completionHandler(nil,error)

            } else {
              print("User signs up successfully")
                let newUserInfo = authResult?.user
                let email = newUserInfo?.email
                let token = newUserInfo?.uid
                var user = [String]()
                user.append(token!)
                user.append(email!)
                completionHandler(user,nil)

            }
        }

    }
}
