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
            "facilityName":order.facilityName,
            "city":order.city ,
            "street":order.street,
            "buildingNumber":order.buildingNumber,
            "responsiblePerson":order.responsiblePerson,
            "mobile":order.mobile,
            "facilityMobileNumber":order.facilityMobileNumber,
            "fax":order.fax,
            "numberOfBodyGuard":order.numberOfBodyGuard,
            "startDate":order.startDate,
            "numberOfDays":order.numberOfDays,
            "numberOfShift":order.numberOfShift
        ]
        
        childRef.child(orderId!).setValue(userDict)
        
        
    }}
