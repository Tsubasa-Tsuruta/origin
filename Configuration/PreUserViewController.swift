//
//  subViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/07.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit
import Eureka

class PreUserViewController: FormViewController {
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ユーザ情報登録(未確定)"
        self.view.backgroundColor = UIColor.white
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"logo_pc.png"))
        
        let myButton = UIButton(frame: CGRect(x:0, y:0, width:200, height:50))
        myButton.backgroundColor = UIColor.orange
        myButton.layer.masksToBounds = true
        myButton.setTitle("登録", for: .normal)
        myButton.layer.cornerRadius = 5.0
        myButton.layer.position = CGPoint(x:self.view.bounds.width/2, y:550)
        myButton.addTarget(self, action: #selector(onClickMyButton), for: .touchUpInside)
        self.view.addSubview(myButton);
        
        form +++ Section()
            <<< TextRow(){
                $0.title = "お名前"
                $0.placeholder = "お名前入力"
                }.onChange{row in
                    self.delegate.name = row.value!
            }
            <<< TextRow(){
                $0.title = "フリガナ"
                $0.placeholder = "フリガナ入力"
                }.onChange{row in
                    self.delegate.phonetic = row.value!
            }
            <<< TextRow(){
                $0.title = "ご住所"
                $0.placeholder = "ご住所入力"
                }.onChange{row in
                    self.delegate.address = row.value!
            }
            <<< TextRow(){
                $0.title = "お電話番号"
                $0.placeholder = "お電話番号入力"
                }.onChange{row in
                    self.delegate.number = row.value!
        }
        
        
        
        
        
        
    }
    
    
    internal func onClickMyButton(sender: UIButton){
        
        let myUserVC: FormViewController = UserViewController()
        self.navigationController?.pushViewController(myUserVC, animated: true)
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
