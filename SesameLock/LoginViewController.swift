//
//  ViewController.swift
//  SesameLock
//
//  Created by 翟怀楼 on 16/2/13.
//  Copyright © 2016年 翟怀楼. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    // 关联按钮
    @IBOutlet weak var lockImage: UIImageView!
    @IBOutlet weak var 登陆按钮: UIButton!
    @IBOutlet weak var 跳过按钮: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 设置按钮圆角
        登陆按钮.layer.cornerRadius = 7
        跳过按钮.layer.cornerRadius = 7
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

