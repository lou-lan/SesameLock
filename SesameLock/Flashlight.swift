//
//  Flashlight.swift
//  SesameLock
//
//  Created by 翟怀楼 on 16/2/23.
//  Copyright © 2016年 翟怀楼. All rights reserved.
//
import Foundation

class FlashlightControl: NSObject {
    
    var on: Bool = false {
        didSet {
            if on == true {
                myOn()
            } else {
                myOff()
            }
            
        }
    }
    // 开
    private func myOn() {
        // 执行开启后的一系列操作
        print("开")
        
    }
    // 关
    private func myOff() {
        print("关")
    }

}
