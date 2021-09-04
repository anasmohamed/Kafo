//
//  FacilitiesSccurityApplicationViewModel.swift
//  kafo
//
//  Created by no one on 03/09/2021.
//

import Foundation
class FacilitiesSccurityApplicationViewModel {
    private let facilitiesSccurityApplicationFirebaseManager = FacilitiesSccurityApplicationFirebaseManager()
    private var users: [FacilitiesSccurityApplicationModel] = [FacilitiesSccurityApplicationModel]()
    
    private var order = FacilitiesSccurityApplicationModel()
    //    private var users = [User]()
    var isStartDateTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isNumberOfBodyGuardTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isNumberOfDaysTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isCityTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isStreetTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isFacilityNameTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isFacilityMobileNumberTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isMobileTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isFaxTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isBuildingNumberTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isResponsiblePersonTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isNumberOfShiftTextFieldHighLighted: Observable<Bool> = Observable(false)

    var errorMessage: Observable<String?> = Observable(nil)
    var getUsersSuccess: Observable<[User]?> = Observable(nil)

    func update(
        facilityName:String,city :String,street:String,buildingNumber:String,responsiblePerson:String,mobile:String,facilityMobileNumber:String,fax:String,numberOfBodyGuard:String,startDate:String,numberOfDays:String,numberOfShift:String)  {
        order.facilityName = facilityName
        order.city = city
        order.street = street
        order.buildingNumber = buildingNumber
        order.responsiblePerson = responsiblePerson
        order.mobile = mobile
        order.facilityMobileNumber = facilityMobileNumber
        order.fax = fax
        order.numberOfBodyGuard = numberOfBodyGuard
        order.startDate = startDate
        order.numberOfDays = numberOfDays
        order.numberOfShift = numberOfShift
    }
   
    
    
   
    func setOrder()  {
        facilitiesSccurityApplicationFirebaseManager.sendOrderData(order: order)
    }
    func credentialsInput() -> CredentialsInputStatus {
       

        
        if order.facilityName.isEmpty {
            errorMessage.value = "Facility Name field is empty."
            isFacilityNameTextFieldHighLighted.value = true
            return .Incorrect
        }
       
        if order.numberOfBodyGuard.isEmpty {
            errorMessage.value = "Number Of bodygaurd field is empty."
            isNumberOfBodyGuardTextFieldHighLighted.value = true
            return .Incorrect
        }
       
        if order.buildingNumber.isEmpty {
            errorMessage.value = "Building Number field is empty."
            isBuildingNumberTextFieldHighLighted.value = true
            return .Incorrect
        }
       
        if order.city.isEmpty {
            errorMessage.value = "City field is empty."
            isCityTextFieldHighLighted.value = true
            return .Incorrect
        }
        if order.facilityMobileNumber.isEmpty {
            errorMessage.value = "Facility Mobile Number field is empty."
            isFacilityMobileNumberTextFieldHighLighted.value = true
            return .Incorrect
        }
        if order.fax.isEmpty {
            errorMessage.value = "Fax field is empty."
            isFaxTextFieldHighLighted.value = true
            return .Incorrect
        }
        if order.mobile.isEmpty {
            errorMessage.value = "Mobile field is empty."
            isMobileTextFieldHighLighted.value = true
            return .Incorrect
        }
        if order.street.isEmpty {
            errorMessage.value = "Street field is empty."
            isStreetTextFieldHighLighted.value = true
            return .Incorrect
        }
        if order.numberOfDays.isEmpty {
            errorMessage.value = "Number Of Days field is empty."
            isNumberOfDaysTextFieldHighLighted.value = true
            return .Incorrect
        }
        if order.responsiblePerson.isEmpty {
            errorMessage.value = "Responsible Person field is empty."
            isResponsiblePersonTextFieldHighLighted.value = true
            return .Incorrect
        }
        if order.numberOfShift.isEmpty {
            errorMessage.value = "Number Of Shift  field is empty."
            isResponsiblePersonTextFieldHighLighted.value = true
            return .Incorrect
        }
       
        return .Correct
    }
}
extension FacilitiesSccurityApplicationViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}
