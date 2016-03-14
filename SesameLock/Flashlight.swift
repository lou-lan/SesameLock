//
//  Flashlight.swift
//  SesameLock
//
//  Created by 翟怀楼 on 16/2/23.
//  Copyright © 2016年 翟怀楼. All rights reserved.
//
import Foundation
import AVFoundation

class FlashlightControl: NSObject {
    
    let device:AVCaptureDevice=AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
    var isLghtOn:Bool=false
    
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
        do
        {
            try device.lockForConfiguration()
            device.torchMode=AVCaptureTorchMode.On
            device.unlockForConfiguration()
        }
        catch
        {
            
        }
        
    }
    // 关
    private func myOff() {
        print("关")
        do
        {
            try device.lockForConfiguration()
            device.torchMode=AVCaptureTorchMode.Off
            device.unlockForConfiguration()
        }
        catch
        {
            
        }
    }

}
