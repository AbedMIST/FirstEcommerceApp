//
//  CartViewController.swift
//  FirstEcommerce
//
//  Created by BS1095 on 9/5/23.
//

import UIKit
import SDWebImage



class CartViewController: UIViewController, CartDelegate {
    

    @IBOutlet weak var prodLabel: UILabel!
    @IBOutlet weak var itemView: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var cpn: UIButton!
    @IBOutlet weak var gft: UIButton!
    @IBOutlet weak var cpnField: UITextField!
    @IBOutlet weak var gftField: UITextField!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var totLabel: UILabel!
    @IBOutlet weak var navView: UIStackView!
    @IBOutlet weak var annoyingLabel: UILabel!
    @IBOutlet weak var bottomNav: UIStackView!
    
    var cur_cartList = [SaleData]()     //list of objects
    //let rainbow: [UIColor] = [.red, .yellow, .green, .orange, .blue, .purple, .magenta]
    var total = 0.00
    
    let cellSpacingHeight: CGFloat = 400.0
    var timer: Timer?
    
    var myTableCell = MyTableViewCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableCell.delegate = self
        
        
        title = "Shopping Cart"
        
        //configureItem()     //for navigation controller navBar
        //All gradient layer
        navView.backgroundColor = .white
        
          let gradientLayer = CAGradientLayer()
          // Set the colors and locations for the gradient layer
          gradientLayer.colors = [UIColor(red: 0.031, green: 0.553, blue: 0.976, alpha: 1).cgColor,
                                  UIColor(red: 0.027, green: 0.773, blue: 0.984, alpha: 1).cgColor,
                                  UIColor(red: 0.043, green: 0.969, blue: 0.922, alpha: 1).cgColor ]
        
          gradientLayer.locations = [0.18, 0.58, 1]

          // Set the start and end points for the gradient layer
          gradientLayer.startPoint = CGPoint(x: 0.75, y: 0.5)
          gradientLayer.endPoint = CGPoint(x: 0.25, y: 0.5)
        
          gradientLayer.frame = navView.bounds
        
        navView.layer.insertSublayer(gradientLayer, at: 0)
        
        
        let gradient = CAGradientLayer()      //another layer
        
        gradient.colors = [UIColor(red: 0.031, green: 0.553, blue: 0.976, alpha: 1).cgColor,
                                UIColor(red: 0.027, green: 0.773, blue: 0.984, alpha: 1).cgColor,
                                UIColor(red: 0.043, green: 0.969, blue: 0.922, alpha: 1).cgColor ]
      
        gradient.locations = [0.18, 0.58, 1]

        gradient.startPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.25, y: 0.5)
      
        gradient.frame = bottomNav.bounds
      
        bottomNav.layer.insertSublayer(gradient, at: 0)
        
        
        
        
        
        
        
        //for other items
        itemView.layer.cornerRadius = 8
        itemView.layer.masksToBounds = true    //clipping
        
        cpnField.layer.cornerRadius = 15
        cpnField.layer.borderWidth = 1
        cpnField.layer.borderColor = UIColor.gray.cgColor
        cpnField.layer.masksToBounds = true
        
        cpn.layer.cornerRadius = 15
        cpn.layer.masksToBounds = true
        
        gftField.layer.cornerRadius = 15
        gftField.layer.borderWidth = 1
        gftField.layer.borderColor = UIColor.gray.cgColor
        gftField.layer.masksToBounds = true
        
        gft.layer.cornerRadius = 15
        gft.layer.masksToBounds = true
        
        
        loadData()   //need to call it for the change in tableView
        
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(loadData), userInfo: nil, repeats: true)
        
        //Networking
        let baseURL = "https://demo460.nop-station.com/api"
        let urlString = baseURL + "/shoppingcart/cart"
        performReq(urlString: urlString)
        
        
    }
    
    
    @objc func loadData(){
        let obj = cartService.singletonObj
        cur_cartList = obj.getVal()
        myTableView.reloadData()
        totalPrice()
    }
    
    @objc func refreshBtn(){
        print("Page refreshed..")
        loadData()
    }
    
    
    
    
    
    func performReq(urlString: String){    //networking section for retrieve data
        
        if let url = URL(string: urlString){
            
            
            let session = URLSession(configuration: .default)
            
            
            var request = URLRequest(url: url)
            
            
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            // Set the device ID in a custom header field
            let deviceId = "44b4d8cd-7a2d-4a5f-a0e2-798021f1e295"
            request.addValue(deviceId, forHTTPHeaderField: "DeviceId")
            
            
            
            let task = session.dataTask(with: request) { [self] data, response, error in
                if(error != nil){
                    print(error!)
                }
                
                if let safeData = data {    //retrieve data(safely unwrap)
                    
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                    
                    parseJSON(productData: safeData)
                        
                    
                    DispatchQueue.main.async {      //call main thread to update UI in background(VVI)
                        self.myTableView.reloadData()
                        self.totalPrice()
                    }
                    
                }

            }

            
            task.resume()
            
        }
    }
    
    func parseJSON(productData: Data) {
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(ShoppingCartResponse.self, from: productData) //mapping
            
            print(decodedData.data.cart.items.count)
            print(decodedData.data.cart.items[0].productName)
            print(decodedData.data.cart.items[0].picture.imageURL)
            
            for i in 0 ..< decodedData.data.cart.items.count {

                let id = decodedData.data.cart.items[i].id        //need to detect cell
                let name = decodedData.data.cart.items[i].productName
                let prcVal = decodedData.data.cart.items[i].unitPriceValue
                let desc = ""       //no need
                let img = decodedData.data.cart.items[i].picture.imageURL
                let amount = Double(decodedData.data.cart.items[i].quantity)

                let product = SaleData(id: id, categoryPic: img, categoryName: name, price: prcVal, desc: desc, amnt: amount)
                cur_cartList.append(product)   //local cart list

            }
            
        }
        catch{
            print(error)
        }
    }
    
    
    
    @IBAction func cpnAc(_ sender: UIButton) {
        
    }
    @IBAction func gftAc(_ sender: UIButton) {
        
    }
    
    
    func updateUI(){           //need to call after every change

        print("Delagate method called ??")
        //print(cur_cartList.count)

        DispatchQueue.main.async {      //call main thread to update UI in background(VVI)
            self.myTableView.reloadData()
            self.totalPrice()
        }
    }
    
    func practice(n: Int) {
        print("In Cart View Controller.\(n)")
    }
    
    func totalPrice() {   //need to refresh every time
        
        total = 0.0
        for l in cur_cartList {
            total += l.price * l.amount
            //print("\(l.categoryName) has \(l.price) dollar ->\(total).")
        }
        
        subLabel.text = "$" + String(total)
        total += 5
        totLabel.text = "$" + String(total)
        
        itemView.text = String(cur_cartList.count) + " ITEM(S)"
    }
    
}


extension CartViewController: UITableViewDelegate, UITableViewDataSource {  //for delegate func


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cur_cartList.count
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return cur_cartList.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return cellSpacingHeight/2
//    }
//
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return cellSpacingHeight/2
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//For every cell
        
        // create a new cell if needed or reuse an old one
        print(cur_cartList.count)
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! MyTableViewCell
        
        cell.backView.layer.cornerRadius = 8
        cell.backView.clipsToBounds = true
        
        //making data dynamic from the cartList
        //cell.img.image = UIImage(named: cur_cartList[indexPath.row].categoryPic)
        cell.naam.text = cur_cartList[indexPath.row].categoryName
        cell.dollar.text = "$" + String(cur_cartList[indexPath.row].price)
        cell.img.sd_setImage(with: URL(string: cur_cartList[indexPath.row].categoryPic), completed: nil)
        
        cell.amnt.text = String(format: "%.0f", cur_cartList[indexPath.row].amount)
        cell.id = cur_cartList[indexPath.row].id

        return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

}
