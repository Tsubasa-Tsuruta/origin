//
//  PreIdViewController.swift
//  Configuration
//
//  Created by Tsubasa Tsuruta on 2016/11/09.
//  Copyright © 2016年 Tsubasa Tsuruta. All rights reserved.
//

import UIKit
import Eureka

class PreIdViewController: FormViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    var delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var photoMode = ""
    
    var myImageView2 = UIImageView(frame: CGRect(x:0, y:0, width:50, height:30))
    var myImageView3 = UIImageView(frame: CGRect(x:0, y:0, width:50, height:30))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "身分証登録"
        self.navigationItem.titleView = UIImageView(image:UIImage(named:"logo_pc.png"))
        self.view.backgroundColor = UIColor.white
        
        //Label
        let myLabel = UILabel(frame: CGRect(x:0, y:0, width:350, height:300))
        myLabel.text = "身分証明証として登録できるのは、\n以下の証明書になります。\n両面(個人番号カードは表面のみ)を\nスキャンまたは撮影して\n登録してください。"
        myLabel.numberOfLines = 0
        myLabel.sizeToFit()
        myLabel.textAlignment = NSTextAlignment.center//センター揃え
        myLabel.layer.position = CGPoint(x:self.view.bounds.width/2, y:250)
        self.view.addSubview(myLabel)
        
        let myImageView = UIImageView(frame: CGRect(x:0, y:0, width:self.view.bounds.width-100, height:200))
        let myImage = UIImage(named: "身分証.jpg")
        myImageView.image = myImage
        myImageView.layer.position = CGPoint(x:self.view.bounds.width/2, y:410)
        self.view.addSubview(myImageView)
        
        myImageView2.layer.position = CGPoint(x:self.view.bounds.width/2-40, y:120)
        self.view.addSubview(myImageView2)
        
        myImageView3.layer.position = CGPoint(x:self.view.bounds.width/2-40, y:165)
        self.view.addSubview(myImageView3)
        
        //Button
        let myButton = UIButton(frame: CGRect(x:0, y:0, width:200, height:50))
        myButton.backgroundColor = UIColor.orange
        myButton.layer.masksToBounds = true
        myButton.setTitle("登録", for: .normal)
        myButton.layer.cornerRadius = 5.0
        myButton.layer.position = CGPoint(x:self.view.bounds.width/2, y:550)
        myButton.addTarget(self, action: #selector(onClickMyButton), for: .touchUpInside)
        self.view.addSubview(myButton)
        
        
        form +++ Section()
            <<< ActionSheetRow<String>() {
                $0.title = "表面"
                $0.selectorTitle = "写真をアップロード"
                $0.options = ["カメラで撮影", "ギャラリーの選択", "キャンセル"]
                }.onChange{row in
                    self.photoMode = "2"
                    switch row.value! {
                    case "カメラで撮影": self.cameraStart()
                    case "ギャラリーの選択": self.showAlbum()
                    default: break
                    }
            }
            
            <<< ActionSheetRow<String>() {
                $0.title = "裏面"
                $0.selectorTitle = "ファイルをアップロード"
                $0.options = ["カメラで撮影", "ギャラリーの選択", "キャンセル"]
                }.onChange{row in
                    self.photoMode = "3"
                    switch row.value! {
                    case "カメラで撮影": self.cameraStart()
                    case "ギャラリーの選択": self.showAlbum()
                    default: break
                    }
        }
        
    }
    
    
    func cameraStart() {
        
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
    }
    
    //　撮影が完了時した時に呼ばれる
    func imagePickerController(_ imagePicker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if photoMode == "2"{
                myImageView2.contentMode = .scaleAspectFit
                myImageView2.image = pickedImage
            }else{
                myImageView3.contentMode = .scaleAspectFit
                myImageView3.image = pickedImage
            }
        }
        
        //閉じる処理
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // 書き込み完了結果の受け取り
    func image(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        print("1")
        
        if error != nil {
            print(error.code)
        }
    }
    
    // アルバムを表示
    func showAlbum() {
        let sourceType:UIImagePickerControllerSourceType = UIImagePickerControllerSourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    internal func onClickMyButton(sender: UIButton){
        self.delegate.image2 = myImageView2.image!
        self.delegate.image3 = myImageView3.image!
        let myIdVC: UIViewController = IdViewController()
        self.navigationController?.pushViewController(myIdVC, animated: true)
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
