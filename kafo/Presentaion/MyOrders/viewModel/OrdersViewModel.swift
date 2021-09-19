//
//  OrdersViewModel.swift
//  kafo
//
//  Created by no one on 19/09/2021.
//

import Foundation
class OrdersViewModel {
    private let ordersFirebaseManger = OrdersFirebaseManger()
    private var orders: [Order] = [Order]()
    {
        didSet{
            getOrderSuccess.value = orders
        }
    }
    private var order = Order()
    //    private var users = [User]()
    var isPasswordTextFieldHighLighted: Observable<Bool> = Observable(false)
    var isEmailTextFieldHighLighted: Observable<Bool> = Observable(false)
    var errorMessage: Observable<String?> = Observable(nil)
    var getOrderSuccess: Observable<[Order]?> = Observable(nil)

    
    
    
    
   
    var numberOfItems: Int {
        return orders.count
    }
    func getData(index: Int) -> Order {
        return orders[index]
    }
    
    func getListOfBodyGuards(id:String) {
        ordersFirebaseManger.getOrders(id: id){ orders,error  in
            
            self.orders = orders!
            
        }
    }
}
