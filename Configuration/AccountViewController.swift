//
//  AccountViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/09.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit
import Eureka

class AccountViewController: FormViewController {
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "振込先口座の登録(確定)"
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"logo_pc.png"))
        self.view.backgroundColor = UIColor.blue
        
        let myButton = UIButton(frame: CGRect(x:0, y:0, width:200, height:50))
        myButton.backgroundColor = UIColor.orange
        myButton.layer.masksToBounds = true
        myButton.setTitle("変更", for: .normal)
        myButton.layer.cornerRadius = 5.0
        myButton.layer.position = CGPoint(x:self.view.bounds.width/2, y:550)
        self.view.addSubview(myButton);
        
        form +++ Section()
            <<< LabelRow(){
                $0.title = "銀行"
                $0.value = self.delegate.bank
            }
            <<< LabelRow(){
                $0.title = "口座種別"
                $0.value = self.delegate.account
            }
            <<< LabelRow(){
                $0.title = "支店コード"
                $0.value = self.delegate.code
            }
            <<< LabelRow(){
                $0.title = "口座番号"
                $0.value = self.delegate.bankNumber
            }
            <<< LabelRow(){
                $0.title = "口座名義(セイ)"
                $0.value = self.delegate.lastName
            }
            <<< LabelRow(){
                $0.title = "口座名義(メイ)"
                $0.value = self.delegate.firstName
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
