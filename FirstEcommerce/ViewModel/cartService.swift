//
//  cartService.swift
//  FirstEcommerce
//
//  Created by BS1095 on 12/5/23.
//


import Foundation

class cartService {
    
    // create a singleton class
    static let singletonObj = cartService()
    
    var cartList = [SaleData]()

    private init() {
     
    }
    
    
    func addToCart(item: SaleData) {
        
        cartList.append(item)
    }
    
    func removeItem(index: Int) {
        cartList.remove(at: index)
    }
    
    func getVal() -> [SaleData]{   //return all cart items
        return cartList
    }
    
    func getCartSize()->Int {
        return cartList.count
    }
}
