//
//  HelpViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/09.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "ヘルプ・その他"
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"logo_pc.png"))
        self.view.backgroundColor = UIColor.white
        
        let myLabel = UILabel(frame: CGRect(x:0, y:0, width:350, height:200))
        myLabel.text = "？"
        myLabel.numberOfLines = 0
        myLabel.sizeToFit()
        myLabel.textAlignment = NSTextAlignment.center//センター揃え
        myLabel.layer.position = CGPoint(x:self.view.bounds.width/2, y:350)
        self.view.addSubview(myLabel)
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
