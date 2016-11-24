//
//  ChangeViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/09.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit

class ChangeViewController: UIViewController {
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "メールアドレス・パスワード変更"
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"logo_pc.png"))
        self.view.backgroundColor = UIColor.white
        
        let myLabel = UILabel(frame: CGRect(x:0, y:0, width:350, height:200))
        myLabel.text = "あなたのメールアドレス\n\(self.delegate.mailAddress)"
        myLabel.numberOfLines = 0
        myLabel.sizeToFit()
        myLabel.textAlignment = NSTextAlignment.center//センター揃え
        myLabel.layer.position = CGPoint(x:self.view.bounds.width/2, y:150)
        self.view.addSubview(myLabel)
        
        let myButton1 = UIButton(frame: CGRect(x:0, y:0, width:300, height:50))
        myButton1.backgroundColor = UIColor.orange
        myButton1.layer.masksToBounds = true
        myButton1.setTitle("メールアドレス変更", for: .normal)
        myButton1.layer.cornerRadius = 5.0
        myButton1.layer.position = CGPoint(x:self.view.bounds.width/2, y:400)
        myButton1.addTarget(self, action: #selector(onClickMyButton1), for: .touchUpInside)
        self.view.addSubview(myButton1);
        
        let myButton2 = UIButton(frame: CGRect(x:0, y:0, width:300, height:50))
        myButton2.backgroundColor = UIColor.orange
        myButton2.layer.masksToBounds = true
        myButton2.setTitle("パスワード変更", for: .normal)
        myButton2.layer.cornerRadius = 5.0
        myButton2.layer.position = CGPoint(x:self.view.bounds.width/2, y:550)
        myButton2.addTarget(self, action: #selector(onClickMyButton2), for: .touchUpInside)
        self.view.addSubview(myButton2);
    }
    
    internal func onClickMyButton1(sender: UIButton){
        let myPreMailVC: UIViewController = PreChangeMailViewController()
        self.navigationController?.pushViewController(myPreMailVC, animated: true)
    }
    
    internal func onClickMyButton2(sender: UIButton){
        let myPrePassVC: UIViewController = PreChangePasswordViewController()
        self.navigationController?.pushViewController(myPrePassVC, animated: true)
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
