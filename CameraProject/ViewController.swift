//
//  ViewController.swift
//  CameraProject
//
//  Created by 城間海月 on 2019/11/19.
//  Copyright © 2019 Mizuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // カメラボタン
    @IBAction func runCamera(_ sender: UIButton) {
        // ユーザーがカメラの使用を許可したかチェック
        // 許可している場合、カメラの画面を作成
        // カメラ画面を表示
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // カメラが許可されている場合
            print("カメラの使用が許可されました")
            
            // カメラの画面を作成
            // UIImagePickerController：カメラorアルバムのh画面を担当
            let cameraView = UIImagePickerController()
            cameraView.sourceType = .camera
            cameraView.delegate = self
            
            // カメラ画面を表示
            present(cameraView, animated: true, completion: nil)
            
        } else {
            // カメラが許可されていない場合
            print("カメラの使用が許可されませんでした")
        }
        
    }
    
    // アルバムボタン
    @IBAction func runAlbum(_ sender: UIButton) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // アルバムの使用が許可されている場合
            
            // アルバムの画面を作成
            let albumView = UIImagePickerController()
            albumView.sourceType = .photoLibrary
            albumView.delegate = self
            
            // アルバムの画面を表示
            present(albumView, animated: true, completion: nil)
        }
        
    }
    
    // 保存ボタン
    @IBAction func savePhoto(_ sender: UIButton) {
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey :Any]) {
        
        // 写真が存在する場合、
        // その写真を画面に表示する
        // 表示されているカメラorアルバムの画面を閉じる
        
        if let pickedImage = info[.originalImage] as? UIImage {
            //写真が存在する場合、変数pickedImageにその写真が渡される
            
            // その写真を画面に表示する
            imageView.image = pickedImage
        }
        // picker：カメラorアルバム画面
        // dismiss：画面を閉じる
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}

