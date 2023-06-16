

import Foundation


class SaleData {    //datatype: every item obj --> model
    
    var id: Int
    var categoryPic: String
    var categoryName: String
    var price: Double
    var desc: String
    var amount: Double
    
    init(id: Int, categoryPic: String, categoryName: String, price: Double, desc: String, amnt: Double) {
        self.id = id
        self.categoryPic = categoryPic
        self.categoryName = categoryName
        self.price = price
        self.desc = desc
        self.amount = amnt
    }
}




