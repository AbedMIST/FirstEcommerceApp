//
//  ViewController.swift
//  FirstEcommerce
//
//  Created by BS1095 on 8/5/23.
//

import UIKit
import SDWebImage  //used to show webImage from URL


class HomeViewController: UIViewController {   //using Collection View to show items

    @IBOutlet weak var navItem: UINavigationItem!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var categoryList = [SaleData]()     //list of objects
    
    var s1 = ""
    var s2 = ""
    var s3 = 0
    var s4 = ""
    var s5 = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = "Welcome to our ecommerce platform."
        configureNav()
        
        
        //get data for category list
        let baseURL = "https://demo460.nop-station.com"
        let urlString = baseURL + "/api/home/featureproducts"
        performReq(urlString: urlString)
    }
    
    func configureNav() {
        
        
        
//          let gradientLayer = CAGradientLayer()
//          // Set the colors and locations for the gradient layer
//          gradientLayer.colors = [UIColor(red: 0.031, green: 0.553, blue: 0.976, alpha: 1).cgColor,
//                                  UIColor(red: 0.027, green: 0.773, blue: 0.984, alpha: 1).cgColor,
//                                  UIColor(red: 0.043, green: 0.969, blue: 0.922, alpha: 1).cgColor ]
//
//          gradientLayer.locations = [0.18, 0.58, 1]
//
//          // Set the start and end points for the gradient layer
//          gradientLayer.startPoint = CGPoint(x: 0.75, y: 0.5)
//          gradientLayer.endPoint = CGPoint(x: 0.25, y: 0.5)
//
//        gradientLayer.frame = navigationController?.navigationBar.bounds ??
//
//        navView.layer.insertSublayer(gradientLayer, at: 0)
        
        
                
        self.navItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh , target: self, action: nil)
        if let backImage = UIImage(systemName: "chevron.left") {
            let backButton = UIBarButtonItem(image: backImage, style: .plain, target: self, action: nil)
            backButton.tintColor = .white
            self.navigationItem.leftBarButtonItem = backButton
        }
        
        self.navItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "basket"), style: .done , target: self, action: nil)
        if let image = UIImage(systemName: "basket.fill") {
            let button = UIBarButtonItem(image: image, style: .plain , target: self, action: #selector(goToCart))
            button.tintColor = .white
            self.navigationItem.rightBarButtonItem = button
        }
    }
    
    
    @objc func goToCart(){
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    func performReq(urlString: String){    //networking section for retrieve data
        
        //1. Create a URL obj
        if let url = URL(string: urlString){
            
            
            //2. Create a URL session -> work as a browser
            let session = URLSession(configuration: .default)
            
            
            
            // Create a mutable request
            var request = URLRequest(url: url)
            
            // Add headers to the request
            // Set the "Accept" header
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            // Set the device ID in a custom header field
            let deviceId = "44b4d8cd-7a2d-4a5f-a0e2-798021f1e294"
            request.addValue(deviceId, forHTTPHeaderField: "DeviceId")
            
            
            
            //3. Give the session a task with the url obj (using closure for completion handler)
            let task = session.dataTask(with: request) { [self] data, response, error in
                if(error != nil){
                    print(error!)
                }
                
                if let safeData = data {    //retrieve data(safely unwrap)
                    
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString!)
                    
                    parseJSON(productData: safeData)
                        
                    print(categoryList.count)
                    
                    DispatchQueue.main.async {      //call main thread to update UI in background(VVI)
                        myCollectionView.reloadData()
                    }
                    
//                    if let weather = parseJSON(productData: safeData){
                        
//                        print(weather.conditionName) //WeatherViewController() obj can't be created here
//                        self.delegate?.updateWeather(self,weather: weather)
//                    }
                }

            }

            
            //4. Start the task
            task.resume()
            
        }
    }
    
    func parseJSON(productData: Data) {
        
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(FeatureProductResponse.self, from: productData) //mapping
            print(decodedData.data.count)
            print(decodedData.data[0].name)
            print(decodedData.data[0].productPrice.price)
            print(decodedData.data[0].productPrice.priceValue)
            print(decodedData.data[0].pictureModels[0].imageURL)
            
            for i in 0 ..< decodedData.data.count {
                
                let id = decodedData.data[i].id
                let name = decodedData.data[i].name
                let prc = decodedData.data[i].productPrice.price
                let prcVal = Double(decodedData.data[i].productPrice.priceValue)
                let desc = decodedData.data[i].fullDescription
                let img = decodedData.data[i].pictureModels[0].imageURL  //urlString

                let product = SaleData(id: id, categoryPic: img, categoryName: name, price: prcVal, desc: desc, amnt: 1.0)
                categoryList.append(product)
                
            }
            
        }
        catch{
            print(error)
        }
    }

}


extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout {                                  //for delegate func
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList.count     //return numOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {            //VVI (for every cell)
        
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        //cell.myImage.image = UIImage(named: categoryList[indexPath.row].categoryPic) //for local img
        cell.categoryLabel.text = categoryList[indexPath.row].categoryName
        cell.priceLabel.text = "$" + String(categoryList[indexPath.row].price)
        cell.myImage.sd_setImage(with: URL(string: categoryList[indexPath.row].categoryPic), completed: nil)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize { //itemSize
        
        let size = (collectionView.frame.size.width-30)/3
        return CGSize(width: size, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //print("Selected item \(categoryList[indexPath.row].desc)")
        s1 = categoryList[indexPath.row].categoryName
        s2 = categoryList[indexPath.row].desc
        s3 = categoryList[indexPath.row].id
        s4 = categoryList[indexPath.row].categoryPic
        s5 = categoryList[indexPath.row].price
        
        performSegue(withIdentifier: "goToDest", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { //update val for next pg
        
        if( segue.identifier == "goToDest"){
            
            let destinationVC = segue.destination as! DetailsViewController
            
            destinationVC.name = s1
            destinationVC.des = s2
            destinationVC.id = s3
            destinationVC.image = s4
            destinationVC.price = s5
        }
    }
    
}
