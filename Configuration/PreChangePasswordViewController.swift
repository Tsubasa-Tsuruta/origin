//
//  PreChangePasswordViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/23.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit
import Eureka

class PreChangePasswordViewController: FormViewController {
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

    var confPass = ""
    var confNewPass = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "パスワード変更"
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
                $0.title = "現在のパスワード"
                }.onChange{row in
                    self.confPass = row.value!
            }
            <<< TextRow(){
                $0.title = "新しいパスワード"
                }.onChange{row in
                    self.delegate.newPssword = row.value!
            }
            <<< TextRow(){
                $0.title = "新しいパスワード(確認)"
                }.onChange{row in
                    self.confNewPass = row.value!
        }
        
    }
    
    internal func onClickMyButton(sender: UIButton){
        let myAlert1: UIAlertController = UIAlertController(title: "警告", message: "現在のパスワードに\n誤りがあります", preferredStyle: .alert)
        let myOkAction1 = UIAlertAction(title: "OK", style: .default) { action in
            print("Action OK!!")
        }
        myAlert1.addAction(myOkAction1)
        
        let myAlert2: UIAlertController = UIAlertController(title: "警告", message: "入力された2つのパスワードに\n違いがあります", preferredStyle: .alert)
        let myOkAction2 = UIAlertAction(title: "OK", style: .default) { action in
            print("Action OK!!")
        }
        myAlert2.addAction(myOkAction2)
        
        if self.delegate.password != self.confPass{
            present(myAlert1, animated: true, completion: nil)
        }else if self.confNewPass != self.delegate.newPssword{
            present(myAlert2, animated: true, completion: nil)
        }else{
            self.delegate.password = self.delegate.newPssword
            let myPassVC: FormViewController = ChangePasswordViewController()
            self.navigationController?.pushViewController(myPassVC, animated: true)
        }
    }


        // Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


