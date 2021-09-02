//
//  ListOfBodyGuardsFirabaseManager.swift
//  kafo
//
//  Created by no one on 02/09/2021.
//

import Foundation
import FirebaseDatabase
class ListOfBodyGuardsFirebaseManager {
    var ref = Database.database().reference()
    func getListOfBodyGuards(completionHandler: @escaping ([User]?) -> Void)  {
        let allPlaces = self.ref.child("Users")
        var users = [User]()
           allPlaces.observeSingleEvent(of: .value, with: { snapshot in
               for child in snapshot.children {
                   let snap = child as! DataSnapshot
                   let placeDict = snap.value as! [String: Any]
                   let userType = placeDict["userType"] as? String
                if userType == "alone_bodygourd" {
                    let user = User()
                    user.email = placeDict["email"] as? String ?? ""
                    user.dateOfBirth = placeDict["dateOfBirth"] as? String ?? ""
                    user.firstName = placeDict["firsName"] as? String ?? ""
                    user.lastName = placeDict["lastName"] as? String ?? ""
                    user.gender = placeDict["gender"] as? String ?? ""
                    user.mobileNumber = placeDict["mobileNumbr"] as? String ?? ""
                    users.append(user)
                }
                completionHandler(users)
//                   let 1moreInfo = placeDict["moreinfo"] as! String
               }
           })
    }
    
}
