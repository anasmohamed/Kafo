//
//  FacilitiesSccurityApplicationFirebaseManager.swift
//  kafo
//
//  Created by no one on 03/09/2021.
//

import Foundation
import Firebase
import FirebaseDatabase
class FacilitiesSccurityApplicationFirebaseManager {
    func sendOrderData(order:FacilitiesSccurityApplicationModel )  {
        // 1
        let rootRef = Database.database()
        
        // 2
        let childRef = rootRef.reference(withPath: "KafoBodyGuardFacilityOrder")
        let orderId = childRef.childByAutoId().key
        var userDict : [String:Any?]?
        userDict = [
            "facilityName":"",
            "city":"" ,
            "street":"",
            "buildingNumber":"",
            "responsiblePerson":"",
            "mobile":"",
            "facilityMobileNumber":"",
            "fax":"",
            "numberOfBodyGuard":"",
            "startDate":"",
            "numberOfDays":"",
            "numberOfShift":""
        ]
        
        childRef.child(orderId!).setValue(userDict)
        
        
    }}
