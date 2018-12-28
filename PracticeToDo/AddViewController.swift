//
//  AddViewController.swift
//  PracticeToDo
//
//  Created by 中野湧仁 on 2018/12/28.
//  Copyright © 2018年 中野湧仁. All rights reserved.
//

import UIKit

class AddViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    
    
    var array = [String]()
    
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()

        textField.delegate = self
        
    }
    
    @IBAction func add(_ sender: Any) {
        
//        現在の配列を取り出す
        if (UserDefaults.standard.object(forKey: "todo") != nil){
            array = UserDefaults .standard.object(forKey: "todo") as!
            [String]
        }
        
        
        array.append(textField.text!)
        UserDefaults.standard.set(array, forKey:"todo")
        
//         navigationControllerの階層を一つ戻る
        self.navigationController?.popViewController(animated: true)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
//        キーボードを閉じる
        textField.resignFirstResponder()
        return true
        
    }

}




//pop説明

/*
「navigationcontroller?.popViewControllerAnimated(Bool)」と
「dismissViewControllerAnimated(Bool, completion)」の違いを
おぼえがきします。

どちらも「自分自身を閉じる（Viewを閉じる）」
という動きに変わりはないのですが、ちょっとだけ用途が違います。

これ忘れてるといつかハマりそうだったのでちゃんと勉強し直しました。



結論から言うと
・navigationController?.popViewControllerAnimated(Bool)
    　　→navigationControllerの階層を一つ戻る
・dismissViewControllerAcnimated(Bool, completion)
    　　→ モーダルビューを閉じる
こうなります。
*/
