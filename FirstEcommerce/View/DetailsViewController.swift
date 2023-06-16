//
//  DetailsViewController.swift
//  FirstEcommerce
//
//  Created by BS1095 on 9/5/23.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var itemName: UILabel!
    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var cartNum: UILabel!
    
    
    var id: Int?
    var image: String?
    var name: String?
    var des: String?
    var price: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemName.text = name
        detailsLabel.text = des
    }
    
    
    @IBAction func addCartBtnPressed(_ sender: UIButton) {
        
//        let item = SaleData(id: self.id ?? 0 , categoryPic: self.image ?? "", categoryName: self.name ?? "Sorry", price: self.price ?? 0.0 , desc: self.des ?? "")
//
//        let obj = cartService.singletonObj
//
//        obj.addToCart(item: item)
        
        let baseURL = "https://demo460.nop-station.com/api"
        let urlString = baseURL + "/shoppingCart/addproducttocart/catalog"
        
        performPostReq(urlString: urlString)
        
        
        
        
        let alert = UIAlertController(title: "Congrates", message: "Item added to cart.", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
        alert.addAction(ok)

        // Present alert to user
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func performPostReq(urlString: String){    //networking section for retrieve data
        
        let ID = self.id ?? 0
        let amnt = 1
        
        let newURL = urlString + "/\(ID)/1"
        print(newURL)
        
        if let url = URL(string: newURL){
            
        
            let session = URLSession(configuration: .default)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let deviceId = "44b4d8cd-7a2d-4a5f-a0e2-798021f1e295"
            request.addValue(deviceId, forHTTPHeaderField: "DeviceId")
            
            // Set the HTTP body data
            let temp = "addtocart_" + String(ID) + ".EnteredQuantity"
            let body: [String: Any] = [
                "FormValues": [
                    [
                        "Key": temp,
                        "Value": "1"
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
    
    func parseJSON(cartData: Data) {
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(PostRequestResponse.self, from: cartData) //mapping
            
            print(decodedData.data.totalShoppingCartProducts)
            
            
        }
        catch{
            print(error)
        }
    }
    
    

    @IBAction func backBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
