//
//  ViewController.swift
//  SesameLock
//
//  Created by 翟怀楼 on 16/2/13.
//  Copyright © 2016年 翟怀楼. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 加载关于我们网页
        let url = NSURL(string: "http://sesamelock.github.io/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

