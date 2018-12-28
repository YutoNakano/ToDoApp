//
//  ViewController.swift
//  PracticeToDo
//
//  Created by 中野湧仁 on 2018/12/28.
//  Copyright © 2018年 中野湧仁. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var resultArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if UserDefaults.standard.object(forKey: "todo") != nil {
            
            resultArray = UserDefaults.standard.object(forKey: "todo")
                as! [String]
        }
        
        tableView.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    return resultArray.count
        
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = resultArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
//            配列をけす
            resultArray.remove(at: indexPath.row)
            
            
//            新しい配列を保存
            UserDefaults.standard.set(resultArray,forKey:
            "todo")
            
//            テーブルビューの更新
            tableView.reloadData()
        }
    }
    
    

}

