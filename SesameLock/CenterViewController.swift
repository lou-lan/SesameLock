//
//  ViewController.swift
//  SesameLock
//
//  Created by 翟怀楼 on 16/2/13.
//  Copyright © 2016年 翟怀楼. All rights reserved.
//

import UIKit
import CoreBluetooth

class CenterViewController: UIViewController, CBPeripheralDelegate {
    // 引入控制类
    lazy var flashlightControl = FlashlightControl()
    
    let SERVICE_UUID = CBUUID(string:"FFE0")
    let WRITE_UUID = CBUUID(string:"FFE1")
    
    var ble:BLE!
    
    @IBOutlet weak var onOffButton: UIButton!
    @IBAction func onOffButton(sender: UIButton) {
        
        //设置开关状态
        self.flashlightControl.on = !self.flashlightControl.on
        self.setOnOffButtonImageWithState(self.flashlightControl.on)
        
        //设置开关Hex值
        var data = "00"
        if self.flashlightControl.on == true {
            data = "00"
            
        } else {
            data = "01"
        }
        // Utils
        let hexStrings = data.componentsSeparatedByString(" ")
        let hexDatas = NSMutableData()
        for hexString in hexStrings{
            let hexData = Utils.stringToByte(hexString)
            hexDatas.appendData(hexData)
        }
        // 调用发送函数
        sendData(hexDatas)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 显示用户配置
        self.setOnOffButtonImageWithState(self.flashlightControl.on)
        // 初始化
        self.ble = BLE.shareInstance()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("onUpdateValue:"), name: self.ble.configurationNotifyingCharacteristics[0].UUIDString, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK:设置开关图片
    func setOnOffButtonImageWithState(on: Bool) {
        let img = on ? "Switch-on" : "Switch-off"
        self.onOffButton.setBackgroundImage(UIImage(named: img), forState: .Normal)
    }
    
    // MARK:需要调用的发送函数
    func sendData(data:NSData){
        self.ble.writeValue(data, withCharacteristicUUID: WRITE_UUID, forService: SERVICE_UUID)
    }
    
}

