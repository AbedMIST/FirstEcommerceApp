//
//  Products.swift
//  FirstEcommerce
//
//  Created by BS1095 on 12/5/23.
//

import Foundation


struct Products {           //Model in own format
    
//    let imageName: String
//    let prodName: String
//    let currentPrice: String
//    let priceVal: Int
    
    var prodList = [SaleData]()     //list of objects
    
//    init() {     //All shopping data are stored here
        
//        let category1 = SaleData(id: 1, categoryPic: "Rectangle 523", categoryName: "California Suit 1 pc", price: 349.0 , desc:"California Suit usually refers to the process of combining two or more separate components to produce a certain level of homogeneity.")
//        prodList.append(category1)
//
//
//        let category2 = SaleData(id: 2, categoryPic: "Rectangle 525", categoryName: "Sofa 1 pc", price: 7900.0 , desc: "A sofa is a dish consisting of mixed, mostly natural ingredients. They are typically served chilled or at room temperature, though some can be served warm.")
//        prodList.append(category2)
//
//        let category3 = SaleData(id: 3, categoryPic: "Rectangle 524", categoryName: "Beef 4 pcs", price: 800.0 , desc: "Beef foods are widely used in many types of dishes, both sweet and savory, including many baked goods. Some of the most common preparation methods.")
//        prodList.append(category3)
//
//
//        let category4 = SaleData(id: 4, categoryPic: "Rectangle 527", categoryName: "Orange 12 pcs", price: 400.0, desc:"Shortened in length, the orange fruit is used to describe a popular sandwich made from ground meats that are formed into a patty, cooked, and placed between two halves of a bun. Although the most common Burger is made with meat, there are many alternatives.")
//        prodList.append(category4)
//
//
//        let category5 = SaleData(id: 5, categoryPic: "Rectangle 528", categoryName: "Rui Fish 2 pcs", price: 800.0, desc: "A typical curry Rui fish from the Indian subcontinent consists of chicken stewed in an onion- and tomato-based sauce, flavoured with ginger, garlic, tomato puree, chilli.")
//        prodList.append(category5)
//
//        let category6 = SaleData(id: 6, categoryPic: "Rectangle 529", categoryName: "Chada Fish 2 pcs", price: 1499.0, desc: "Chada is a major source of key nutrients, such as high-quality protein, iron, and B vitamins for many Americans.")
//        prodList.append(category6)
        

//    }
    
    
    
    
    func getData() ->[SaleData]{
        return prodList
    }
}
