//
//  KafoServiceFIrebaseManager.swift
//  kafo
//
//  Created by no one on 03/09/2021.
//

import Foundation
import FirebaseDatabase
class KafoServiceFirebaseManager {
    func sendOrderData(order:KafoBodyGuardOrder )  {
        // 1
        let rootRef = Database.database()
        
        // 2
        let childRef = rootRef.reference(withPath: "KafoBodyGuardOrder")
        let orderId = childRef.childByAutoId().key
        var userDict : [String:Any?]?
        userDict = [
            "gender":order.gender,
            "numberOfBodyGuard":order.numberOfBodyGuard,
            "numberOfDays":order.numbarOfDays,
            "serviceStartDate":order.serviceStartDate,
            "orderId":orderId
//            "firstName":order.firstName,
//            "lastName":order.lastName,
//            "password":order.password,
//            "userType":user.userType,
//            "gender":user.gender,
//            "dateOfBirth":user.dateOfBirth,
//            "city": user.city,
//            "country":user.country,
//            "mobileNumbr":user.mobileNumber
        ]
        
        childRef.child(orderId!).setValue(userDict)
        
        
    }
}
