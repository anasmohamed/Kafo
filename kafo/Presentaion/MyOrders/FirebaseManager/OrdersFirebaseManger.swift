//
//  OrdersFirebaseManger.swift
//  kafo
//
//  Created by no one on 17/09/2021.
//

import Foundation
import Firebase
import FirebaseDatabase
class OrdersFirebaseManger {
    func getOrders(id :String,completionHandler:@escaping ([Order]?,Error?) -> Void)  {
        // 1
        var orders = [Order]()
        let userRef = Database.database().reference(withPath: "FasOrder")
        userRef.observeSingleEvent(of: .value, with: {(snapshot) in
            //                print(snapshot)
//            let userDict = snapshot.children.value(forKey: "") as! [String: Any]
//            let order = Order()
//            var orderTotalMoney = ""
//            var orderDate = ""
//            var orderTime = ""
//            var numberOfHours = ""
//            for child in snapshot.children {
//                let snap = child as! DataSnapshot
//                let userDict = snap.value as! [String: Any]
//                if userDict["clientId"] as! String == id{
//                    orderTotalMoney = userDict["totalMoney"] as! String
//                    orderDate = userDict["orderDate"] as! String
//                    orderTime = userDict["orderTime"] as! String
//                    numberOfHours = userDict["numberOfHours"] as! String
////                    orderDate = userDict["Date"] as! String
////                    orderTime = userDict["time"] as! String
////                    numberOfHours = userDict["dateOfBirth"] as! String
//
//                }else{
//                    orderTotalMoney = userDict["totalMoney"] as! String
////                    orderDate = userDict["Date"] as! String
////                    orderTime = userDict["time"] as! String
////                    numberOfHours = userDict["dateOfBirth"] as! String
//                    
//                }
//                order.numberOfHours = numberOfHours
//                order.totalMoney = orderTotalMoney
//                order.orderDate = orderDate
//                order.orderTime = orderTime
//                orders.append(order)

//            }
            
            
            
//            completionHandler(orders,nil)

       
            
            
            
        }
        
        )
        
        
    }}
