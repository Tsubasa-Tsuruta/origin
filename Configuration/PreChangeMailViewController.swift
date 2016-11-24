//
//  ChangeMailViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/23.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit
import Eureka

class PreChangeMailViewController: FormViewController {
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var confAddress = ""
    var confPass = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ユーザ情報登録"
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"logo_pc.png"))
        
        //Label
        let myLabel = UILabel(frame: CGRect(x:0, y:0, width:350, height:100))
        myLabel.text = "あなたのメールアドレス\n\(self.delegate.mailAddress)"
        myLabel.numberOfLines = 0
        myLabel.sizeToFit()
        myLabel.textAlignment = NSTextAlignment.center//センター揃え
        myLabel.layer.position = CGPoint(x:self.view.bounds.width/2, y:350)
        self.view.addSubview(myLabel)
        
        let myButton = UIButton(frame: CGRect(x:0, y:0, width:200, height:50))
        myButton.backgroundColor = UIColor.orange
        myButton.layer.masksToBounds = true
        myButton.setTitle("変更", for: .normal)
        myButton.layer.cornerRadius = 5.0
        myButton.layer.position = CGPoint(x:self.view.bounds.width/2, y:550)
        myButton.addTarget(self, action: #selector(onClickMyButton), for: .touchUpInside)
        self.view.addSubview(myButton);
        
        
        
        
        form +++ Section()
            <<< TextRow(){
                $0.title = "新しいメールアドレス"
                }.onChange{row in
                    self.delegate.newMailAddress = row.value!
            }
            <<< TextRow(){
                $0.title = "新しいメールアドレス(確認)"
                }.onChange{row in
                    self.confAddress = row.value!
            }
            <<< TextRow(){
                $0.title = "パスワード"
                }.onChange{row in
                    self.confPass = row.value!
        }
        
    }
    
    internal func onClickMyButton(sender: UIButton){
        let myAlert1: UIAlertController = UIAlertController(title: "警告", message: "入力された2つのアドレスに\n違いがあります", preferredStyle: .alert)
        let myOkAction1 = UIAlertAction(title: "OK", style: .default) { action in
            print("Action OK!!")
        }
        myAlert1.addAction(myOkAction1)
        
        let myAlert2: UIAlertController = UIAlertController(title: "警告", message: "パスワードが違います", preferredStyle: .alert)
        let myOkAction2 = UIAlertAction(title: "OK", style: .default) { action in
            print("Action OK!!")
        }
        myAlert2.addAction(myOkAction2)
        
        if self.delegate.newMailAddress != self.confAddress{
            present(myAlert1, animated: true, completion: nil)
        }else if self.confPass != self.delegate.password{
            present(myAlert2, animated: true, completion: nil)
        }else{
            self.delegate.mailAddress = self.delegate.newMailAddress
            let myMailVC: FormViewController = ChangeMailViewController()
            self.navigationController?.pushViewController(myMailVC, animated: true)
        }
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
