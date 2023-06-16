//
//  TableViewCell.swift
//  FirstEcommerce
//
//  Created by BS1095 on 9/5/23.
//

import UIKit


protocol CartDelegate{
    
    func updateUI()
    func practice(n: Int)
}


class MyTableViewCell: UITableViewCell {   //for custom cell
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var naam: UILabel!
    @IBOutlet weak var dollar: UILabel!
    @IBOutlet weak var amnt: UILabel!
    @IBOutlet weak var crossBtn: UIButton!
    @IBOutlet weak var plus: UIButton!
    @IBOutlet weak var minus: UIButton!
    @IBOutlet weak var img: UIImageView!
    
    var id = 0
    
    var delegate: CartDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgroundColor = UIColor.clear
        

    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        plus.layer.borderColor = UIColor.gray.cgColor
        plus.layer.borderWidth = 0.5
        plus.layer.cornerRadius = 15
        plus.layer.masksToBounds = true
        
        minus.layer.borderColor = UIColor.gray.cgColor
        minus.layer.borderWidth = 0.5
        minus.layer.cornerRadius = 15
        minus.layer.masksToBounds = true
        
        
        
        plus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        plus.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        plus.layer.shadowOpacity = 1.0
        plus.layer.shadowRadius = 1.0
        plus.layer.masksToBounds = false
        plus.layer.cornerRadius = 15.0

        
        minus.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        minus.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        minus.layer.shadowOpacity = 1.0
        minus.layer.shadowRadius = 1.0
        minus.layer.masksToBounds = false
        minus.layer.cornerRadius = 15.0
        
        
        amnt.layer.borderWidth = 0.5
        amnt.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    
    
    
    @IBAction func plusBtn(_ sender: UIButton) {
        
        var num = Int(amnt.text!) ?? 0
        num += 1
        amnt.text = String(num)
        
//        var total = 0.00
//        let obj = cartService.singletonObj
//        let cartList = obj.getVal()
        delegate?.practice(n: 20)
        
        let baseURL = "https://demo460.nop-station.com/api"
        let urlString = baseURL + "/shoppingcart/updatecart"
        
        updateReq(urlString: urlString, id: id, quantity: num)
    }
    
    @IBAction func minusBtn(_ sender: UIButton) {
        var num = Int(amnt.text!) ?? 0
        if(num > 1){
            num -= 1
        }
        amnt.text = String(num)
        
//        var total = 0.00
//        let obj = cartService.singletonObj
//        var cartList = obj.getVal()
        
        let baseURL = "https://demo460.nop-station.com/api"
        let urlString = baseURL + "/shoppingcart/updatecart"
        
        updateReq(urlString: urlString, id: id, quantity: num)
    }
    
    
    @IBAction func crossBtnPressed(_ sender: UIButton) {
        
//        let obj = cartService.singletonObj
//        var cartList = obj.getVal()       //this cartList is a duplicate of real list
//
//        for i in 0 ..< cartList.count{
//            if(naam.text == cartList[i].categoryName){
//                obj.removeItem(index: i)
//            }
//        }
//
//        print(obj.cartList.count)
        
        let baseURL = "https://demo460.nop-station.com/api"
        let urlString = baseURL + "/shoppingcart/updatecart"
        
        print(id," ",naam.text)
        //removeReq(urlString: urlString,id: id)
        delegate?.practice(n: 20)
        print(11)
        
        
    }
    
    func removeReq(urlString: String, id: Int){    //networking section for retrieve data
        
    
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let deviceId = "44b4d8cd-7a2d-4a5f-a0e2-798021f1e295"
            request.addValue(deviceId, forHTTPHeaderField: "DeviceId")
            
            // Set the HTTP body data
            let body: [String: Any] = [
                "FormValues": [
                    [
                        "Key": "removefromcart",
                        "Value": String(id)
                    ]
                ]
            ]

            
            do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
            } catch let error {
                    print("Failed to serialize HTTP body:", error)
                    return
            }
            
            //3. Give the session a task with the url obj (using closure for completion handler)
            let task = session.dataTask(with: request) { [self] data, response, error in
                
                if(error != nil){
                    print(error!)
                }
                
                if let safeData = data {    //retrieve data(safely unwrap)
                    
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                    print("Response found")
                    
                    parseJSON(cartData: safeData)
                        
                }

            }

            
            //4. Start the task
            task.resume()
            
        }
    }
    
    func updateReq(urlString: String, id: Int, quantity: Int){    //networking section for retrieve data
        
    
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let deviceId = "44b4d8cd-7a2d-4a5f-a0e2-798021f1e295"
            request.addValue(deviceId, forHTTPHeaderField: "DeviceId")
            
            // Set the HTTP body data
            let temp = "itemquantity" + String(id)
            
            let body: [String: Any] = [
                "FormValues": [
                    [
                        "Key": temp,
                        "Value": String(quantity)
                    ]
                ]
            ]


            do {
                    request.httpBody = try JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
            } catch let error {
                    print("Failed to serialize HTTP body:", error)
                    return
            }
            
            //3. Give the session a task with the url obj (using closure for completion handler)
            let task = session.dataTask(with: request) { [self] data, response, error in
                
                if(error != nil){
                    print(error!)
                }
                
                if let safeData = data {    //retrieve data(safely unwrap)
                    
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                    print("Update Response found")
                    delegate?.practice(n: 11)
                    
                    parseJSON(cartData: safeData)
                        
                }

            }

            
            //4. Start the task
            task.resume()
            
        }
    }
    
    
    
    func parseJSON(cartData: Data) {
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(ShoppingCartResponse.self, from: cartData) //mapping
            
            print(decodedData.data.cart.items.count)
            
            
            delegate?.practice(n: 11)
            self.delegate?.updateUI()     //call for UI update
            
        }
        catch{
            print(error)
        }
    }
    
    
    func totalPrice() {
        
        var total = 0.00
        let obj = cartService.singletonObj
        var cartList = obj.getVal()
        
        for l in cartList {
            total += l.price
            //print("\(l.categoryName) has \(l.price) dollar ->\(total).")
        }
        
        CartViewController().subLabel.text = "$" + String(total)
        total += 5
        CartViewController().totLabel.text = "$" + String(total)
        
    }
    
}
