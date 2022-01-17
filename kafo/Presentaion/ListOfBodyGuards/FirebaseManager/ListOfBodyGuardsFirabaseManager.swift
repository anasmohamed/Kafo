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
        let allPlaces = self.ref.child("BdUserBd")
        var users = [User]()
           allPlaces.observeSingleEvent(of: .value, with: { snapshot in
               for child in snapshot.children {
                   let snap = child as! DataSnapshot
                   let placeDict = snap.value as! [String: Any]
//                   let userType = placeDict["userType"] as? String
//                if userType == "alone_bodygourd" {
                    
                    let user = User()
                    user.email = placeDict["email"] as? String ?? ""
                    user.dateOfBirth = placeDict["date"] as? String ?? ""
                    user.firstName = placeDict["fname"] as? String ?? ""
                    user.lastName = placeDict["lname"] as? String ?? ""
                    user.gender = placeDict["gender"] as? String ?? ""
                    user.mobileNumber = placeDict["phone"] as? String ?? ""
                    users.append(user)
//                }
                completionHandler(users)
//                   let 1moreInfo = placeDict["moreinfo"] as! String
               }
           })
    }
    func sendUserData(order:Order,bodyguardId:String )  {
        // 1
        let rootRef = Database.database()
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let result = formatter.string(from: date)
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let time = String(hour) + " " + String(minutes)
        // 2
        let childRef = rootRef.reference(withPath: "FasOrder")
        let orderId = childRef.childByAutoId().key
        var userDict : [String:Any?]?
        userDict = [
            "buildingnum":"",
            "city":"",
            "contract":"",
            "fasname":"",
            "fasphone":"",
            "fax":"",
            "mananame":"",
            "manaphone":"",
            "numofguards":"",
            "numofshift":"",
            "startdate":"",
            "street":"",
            
//            "city": user.city,
//            "country":user.country,
//            "mobileNumbr":user.mobileNumber
        ]
        
        childRef.child(orderId!).setValue(userDict)
        
        
    }
}
