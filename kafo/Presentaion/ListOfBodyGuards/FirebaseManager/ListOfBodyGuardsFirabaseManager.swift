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
                    user.token = placeDict["userId"] as? String ?? ""
                    users.append(user)
                }
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
        let childRef = rootRef.reference(withPath: "ImmdiateOrder")
        let orderId = childRef.childByAutoId().key
        var userDict : [String:Any?]?
        userDict = [
            "totalMoney":order.totalMoney,
            "orderId":orderId,
            "bodyguardName":order.bodyGaurdName,
            "bodyguardEmail":order.bodyGuardEmail,
            "bodyguardLocation":order.location,
            "bodyguardMoblieNumber":order.bodyGuardMobileNumber,
            "clientName":order.clientName,
            "clientEmail":order.clientEmail,
            "clientMobileNumber":order.clientMobileNumber,
            "numberOfHours":order.numberOfHours,
            "orderDate":result,
            "orderTime":time,
            "clientId":UserDefaults.standard.string(forKey: "userId"),
            "bodyguardId": bodyguardId
//            "city": user.city,
//            "country":user.country,
//            "mobileNumbr":user.mobileNumber
        ]
        
        childRef.child(orderId!).setValue(userDict)
        
        
    }
}
