//
//  KafoServiceViewModel.swift
//  kafo
//
//  Created by no one on 03/09/2021.
//

import Foundation
class KafoServieViewModel {
    private let kafoServiceFirebaseManager = KafoServiceFirebaseManager()
    private var users: [KafoBodyGuardOrder] = [KafoBodyGuardOrder]()
    
    private var order = KafoBodyGuardOrder()
    //    private var users = [User]()
    var isServiceStartDateTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isNumberOfBodyGuardTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isNumberOfDaysTextFieldHighLighted: Observable<Bool> = Observable(false)

    var errorMessage: Observable<String?> = Observable(nil)
    var getUsersSuccess: Observable<[User]?> = Observable(nil)

    func update(gender:String,and numberOfDays:String,numberOfBodyGuard:String,serviceStartDate:String,clientName:String,clientEmail:String,clientMobileNumber:String)  {
        order.gender = gender
        order.numbarOfDays = numberOfDays
        order.numberOfBodyGuard = numberOfBodyGuard
        order.serviceStartDate = serviceStartDate
        order.clientEmail = clientEmail
        order.clientName = clientName
        order.clientMobileNumber = clientMobileNumber
    }
   
    
    
   
    func setOrder()  {
        kafoServiceFirebaseManager.sendOrderData(order: order)
    }
    func credentialsInput() -> CredentialsInputStatus {
       

        
        if order.numbarOfDays.isEmpty {
            errorMessage.value = "Number Of Days field is empty."
            isNumberOfDaysTextFieldHighLighted.value = true
            return .Incorrect
        }
       
        if order.numberOfBodyGuard.isEmpty {
            errorMessage.value = "Number Of bodygaurd field is empty."
            isNumberOfBodyGuardTextFieldHighLighted.value = true
            return .Incorrect
        }
       
        if order.serviceStartDate.isEmpty {
            errorMessage.value = "Service start date field is empty."
            isServiceStartDateTextFieldHighLighted.value = true
            return .Incorrect
        }
       

        return .Correct
    }
}
extension KafoServieViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}
