//
//  ViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/06.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit

class ConfViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var tableView: UITableView!
    
    var item: [String] = ["ユーザー情報確認・登録", "口座情報確認・登録", "身分証確認・登録", "メールアドレス・パスワード変更", "集荷依頼", "ヘルプ・その他"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "設定メイン"
        self.view.backgroundColor = UIColor.white
        //ナビゲーションアイテムのタイトルに画像を設定する。
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"logo_pc.png"))
        tableView = UITableView()
        tableView.frame = UIScreen.main.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
    }
    
    
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.item.count
    }
    
    //セルに値を設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.item[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(item[indexPath.row])")
        
        switch indexPath.row{
        case 0:
            let myPreUserVC: UIViewController = PreUserViewController()
            self.navigationController?.pushViewController(myPreUserVC, animated: true)
        case 1:
            let myPreAccountVC: UIViewController = PreAccountViewController()
            self.navigationController?.pushViewController(myPreAccountVC, animated: true)
        case 2:
            let myPreIdVC: UIViewController = PreIdViewController()
            self.navigationController?.pushViewController(myPreIdVC, animated: true)
        case 3:
            let myChangeVC: UIViewController = ChangeViewController()
            self.navigationController?.pushViewController(myChangeVC, animated: true)
        case 4:
            let myPickupVC: UIViewController = PickupViewController()
            self.navigationController?.pushViewController(myPickupVC, animated: true)
        case 5:
            let myHelpVC: UIViewController = HelpViewController()
            self.navigationController?.pushViewController(myHelpVC, animated: true)
        default:
            break
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

