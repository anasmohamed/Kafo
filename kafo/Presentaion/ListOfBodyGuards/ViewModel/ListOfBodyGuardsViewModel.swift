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
    //    private var users = [User]()
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var getUsersSuccess: Observable<[User]?> = Observable(nil)
    
    
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
}
