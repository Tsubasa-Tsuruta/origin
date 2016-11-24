//
//  PreAccountViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/09.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit
import Eureka

class PreAccountViewController: FormViewController {
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "振込先口座の登録(未確定)"
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
            <<< PickerInlineRow<String>("bank"){
                $0.options = ["三菱東京UFJ銀行", "みずほ銀行", "三井住友銀行", "ゆうちょ銀行", "りそな銀行"]
                $0.title = "銀行"
                }.onChange{row in
                    self.delegate.bank = row.value!
            }

            <<< PickerInlineRow<String>("account"){
                $0.options = ["普通預金", "当座預金"]
                $0.title = "口座種別"
                }.onChange{row in
                    self.delegate.account = row.value!
            }
            <<< TextRow("code"){
                $0.title = "支店コード"
                $0.placeholder = "支店コード入力"
                }.onChange{row in
                    self.delegate.code = row.value!
            }
            <<< TextRow("bankNumber"){
                $0.title = "口座番号"
                $0.placeholder = "口座番号入力"
                }.onChange{row in
                    self.delegate.bankNumber = row.value!
            }
            <<< TextRow("lastName"){
                $0.title = "口座名義(セイ)"
                $0.placeholder = "口座名義(セイ)入力"
                }.onChange{row in
                    self.delegate.lastName = row.value!
            }
            <<< TextRow("firstName"){
                $0.title = "口座名義(メイ)"
                $0.placeholder = "口座名義(メイ)入力"
                }.onChange{row in
                    self.delegate.firstName = row.value!
        }
        
    }

    internal func onClickMyButton(sender: UIButton){
        let myAccountVC: UIViewController = AccountViewController()
        self.navigationController?.pushViewController(myAccountVC, animated: true)
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
