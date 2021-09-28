//
//  ListOfBodyGuards.swift
//  kafo
//
//  Created by no one on 02/09/2021.
//

import Foundation
class ListOfBodyGuardsViewModel{
    private let listOfBodyGuardsFirebaseManager = ListOfBodyGuardsFirebaseManager()
    private var users: [User] = [User]()
    {
        didSet{
            getUsersSuccess.value = users
        }
    }
    private var order = Order()
    //    private var users = [User]()
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var getUsersSuccess: Observable<[User]?> = Observable(nil)

    
    var bodyGuardName = ""
    var bodyGuardEmail = ""
    var bodyGuardMobileNumber = ""
    var bodyGuardLocation = ""
    var clientName = ""
    var clientMobileNumber = ""
    var bodyguardId = ""
    
    
    func update(totalMoney:String,and numberOfHours:String,bodyGuardName:String,bodygauardMobileNumber:String,bodyguardEmail:String,bodyguardLocation:String,clinetName:String,clientMobileNumber:String,clientEmail:String,bodyguardId:String)  {
        order.numberOfHours = numberOfHours
        order.totalMoney = totalMoney
        order.bodyGaurdName = bodyGuardName
        order.clientName = clientName
        order.bodyGuardEmail = bodyGuardEmail
        order.location = bodyguardLocation
        order.clientMobileNumber = clientMobileNumber
        order.clientEmail = clientEmail
        order.bodyGuardMobileNumber = bodyGuardMobileNumber
        self.bodyguardId = bodyguardId
        
    }
    var numberOfItems: Int {
        return users.count
    }
    func getData(index: Int) -> User {
        return users[index]
    }
    
    func getListOfBodyGuards() {
        listOfBodyGuardsFirebaseManager.getListOfBodyGuards{ users in
            
            self.users = users ?? []
            
        }
    }
    func setOrder()  {
        listOfBodyGuardsFirebaseManager.sendUserData(order: order, bodyguardId:bodyguardId )
    }
    func credentialsInput() -> CredentialsInputStatus {
       

        
        if order.numberOfHours.isEmpty {
            errorMessage.value = "Number Of Hours field is empty."
            isPasswordTextFieldHighLighted.value = true
            return .Incorrect
        }
       

        return .Correct
    }
}
extension ListOfBodyGuardsViewModel {
    enum CredentialsInputStatus {
        case Correct
        case Incorrect
    }
}
