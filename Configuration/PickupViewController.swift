//
//  PickupViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/09.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit

class PickupViewController: UIViewController {
    let image1:UIImage = UIImage(named:"STEP3_05.jpg")!
    let image2:UIImage = UIImage(named:"STEP3_03.jpg")!
    let image3:UIImage = UIImage(named:"STEP3_06.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "集荷依頼"
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"logo_pc.png"))
        self.view.backgroundColor = UIColor.white
        
        let myLabel = UILabel(frame: CGRect(x:0, y:0, width:350, height:100))
        myLabel.text = "集荷依頼する運送業者を\n選んでください。\n直接電話がつながります。"
        myLabel.numberOfLines = 0
        myLabel.sizeToFit()
        myLabel.textAlignment = NSTextAlignment.center//センター揃え
        myLabel.layer.position = CGPoint(x:self.view.bounds.width/2, y:150)
        self.view.addSubview(myLabel)
        
        let myButton1 = UIButton(frame: CGRect(x:0, y:0, width:250, height:70))
        myButton1.setBackgroundImage(image1, for: UIControlState.normal);
        myButton1.layer.masksToBounds = true
        myButton1.layer.cornerRadius = 5.0
        myButton1.layer.position = CGPoint(x:self.view.bounds.width/2, y:250)
        //myButton1.addTarget(self, action: #selector(onClickMyButton1), for: .touchUpInside)
        self.view.addSubview(myButton1);
        
        let myButton2 = UIButton(frame: CGRect(x:0, y:0, width:250, height:70))
        myButton2.setBackgroundImage(image2, for: UIControlState.normal);
        myButton2.layer.masksToBounds = true
        myButton2.layer.cornerRadius = 5.0
        myButton2.layer.position = CGPoint(x:self.view.bounds.width/2, y:330)
        //myButton2.addTarget(self, action: #selector(onClickMyButton2), for: .touchUpInside)
        self.view.addSubview(myButton2);
        
        let myButton3 = UIButton(frame: CGRect(x:0, y:0, width:250, height:70))
        myButton3.setBackgroundImage(image3, for: UIControlState.normal);
        myButton3.layer.masksToBounds = true
        myButton3.layer.cornerRadius = 5.0
        myButton3.layer.position = CGPoint(x:self.view.bounds.width/2, y:410)
        //myButton1.addTarget(self, action: #selector(onClickMyButton1), for: .touchUpInside)
        self.view.addSubview(myButton3);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    */

}
