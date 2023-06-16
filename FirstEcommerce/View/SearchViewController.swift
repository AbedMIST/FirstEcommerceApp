//
//  SearchViewController.swift
//  FirstEcommerce
//
//  Created by BS1095 on 12/5/23.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet var mainView: UIView!
    
    @IBOutlet weak var btnOutlet: UIButton!
    
    @IBOutlet weak var navView: UIStackView!
    
    
    
    var flg = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
          gradientLayer.frame = navView.frame
        
          navView.layer.addSublayer(gradientLayer)
        
//        navView.layer.insertSublayer(gradientLayer, at: 0)
        

        if(flg == 0){
            img.isHidden = true
            label1.isHidden = true
            label2.isHidden = true
        }
        else{
            img.isHidden = false
            label1.isHidden = false
            label2.isHidden = false
        }
    }
    
    
    
    @IBAction func searchBtn(_ sender: UIButton) {
        
        if(flg == 1){
            flg = 0
        }
        else{
            flg = 1
        }
        
        self.viewDidLoad()
        
        //performSegue(withIdentifier: "goToBlank", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
