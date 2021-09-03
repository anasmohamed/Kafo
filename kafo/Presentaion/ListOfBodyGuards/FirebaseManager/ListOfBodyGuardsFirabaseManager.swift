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
                    user.city = placeDict["city"] as? String ?? ""
                    user.country = placeDict["country"] as? String ?? ""
                    users.append(user)
                }
                completionHandler(users)
//                   let 1moreInfo = placeDict["moreinfo"] as! String
               }
           })
    }
    func sendUserData(order:Order)  {
        // 1
        let rootRef = Database.database()
        
        // 2
//        let childRef = rootRef.reference(withPath: "Users")
//        let userId = childRef.childByAutoId().key
//        var userDict : [String:Any?]?
//        userDict = [
//            "email":order.email,
//            "userId":userId,
//            "firstName":order.firstName,
//            "lastName":order.lastName,
//            "password":order.password,
//            "userType":user.userType,
//            "gender":user.gender,
//            "dateOfBirth":user.dateOfBirth,
//            "city": user.city,
//            "country":user.country,
//            "mobileNumbr":user.mobileNumber]
//        
//        childRef.child(userId!).setValue(userDict)
    }
}
