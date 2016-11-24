//
//  IdViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/09.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit

class IdViewController: UIViewController {
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "身分証登録"
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"logo_pc.png"))
        self.view.backgroundColor = UIColor.white
        
        //Label
        let myLabel = UILabel(frame: CGRect(x:0, y:0, width:350, height:300))
        myLabel.text = "お客様がご登録いただいた身分証を\nご確認いただけます。"
        myLabel.numberOfLines = 0
        myLabel.sizeToFit()
        myLabel.textAlignment = NSTextAlignment.center//センター揃え
        myLabel.layer.position = CGPoint(x:self.view.bounds.width/2, y:120)
        self.view.addSubview(myLabel)
        
        let myLabel2 = UILabel(frame: CGRect(x:0, y:0, width:50, height:30))
        myLabel2.text = "表面"
        myLabel2.numberOfLines = 0
        myLabel2.sizeToFit()
        myLabel2.textAlignment = NSTextAlignment.center//センター揃え
        myLabel2.layer.position = CGPoint(x:40, y:260)
        self.view.addSubview(myLabel2)
        
        let myLabel3 = UILabel(frame: CGRect(x:0, y:0, width:50, height:30))
        myLabel3.text = "裏面"
        myLabel3.numberOfLines = 0
        myLabel3.sizeToFit()
        myLabel3.textAlignment = NSTextAlignment.center//センター揃え
        myLabel3.layer.position = CGPoint(x:40, y:420)
        self.view.addSubview(myLabel3)
        
        let myImageView2 = UIImageView(frame: CGRect(x:0, y:0, width:self.view.bounds.width-100, height:150))
        myImageView2.image = self.delegate.image2
        myImageView2.layer.position = CGPoint(x:self.view.bounds.width/2+30, y:250)
        self.view.addSubview(myImageView2)
        
        let myImageView3 = UIImageView(frame: CGRect(x:0, y:0, width:self.view.bounds.width-100, height:150))
        myImageView3.image = self.delegate.image3
        myImageView3.layer.position = CGPoint(x:self.view.bounds.width/2+30, y:420)
        self.view.addSubview(myImageView3)

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
