//
//  ViewController.swift
//  SesameLock
//
//  Created by 翟怀楼 on 16/2/13.
//  Copyright © 2016年 翟怀楼. All rights reserved.
//

import UIKit
import CoreBluetooth
let kPushViewController = "PushViewController"

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, BLEDelegate {
    // 绑定蓝牙列表
    @IBOutlet weak var tableView: UITableView!
    
    var ble:BLE!
    var discoveredPeripherals:[CBPeripheral] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 隐藏导航栏
        self.navigationController?.navigationBarHidden = true
        self.ble = BLE.shareInstanceWithDelegate(self)
        self.ble.configurationNotifyingCharacteristics = [CBUUID(string: "FFE0")] // 设置UUID
        self.ble.updatingEOMFlag = "EOM" //数据接收时开始与结束标志
        print("初始化完成")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 视图加载前
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.discoveredPeripherals.removeAll(keepCapacity: true)
        self.ble.scan(nil)
    }
    
    
    // MARK bluetooth delegate
    func centralManagerDidUpdateState(central: CBCentralManager){
        self.ble.centralManagerDidUpdateState()
    }
    func centralManager(central: CBCentralManager, didDiscoverPeripheral peripheral: CBPeripheral, advertisementData: [String : AnyObject], RSSI: NSNumber) {
        self.discoveredPeripherals.append(peripheral)
        tableView.reloadData()
    }
    
    func ble(ble: BLE!, didLossPeripheral peripheral: CBPeripheral!) {
        for i in 0..<self.discoveredPeripherals.count{
            if(peripheral.isEqual(self.discoveredPeripherals[i])){
                self.discoveredPeripherals.removeAtIndex(i)
                break
            }
        }
    }
    
    func ble(ble: BLE!, didUpdateValue value: StringData!, forCharacteristic characteristic: CBCharacteristic, error: NSError!) {
        print(value.string)
    }
    func centralManager(central: CBCentralManager, didConnectPeripheral peripheral: CBPeripheral) {
//        self.performSegueWithIdentifier(kPushViewController, sender: self)
    }
    
    
    
    
    // MARK table delegate
    // 表格区块里有几行单元格
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return discoveredPeripherals.count
    }
    // 显示单元格内容
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = self.discoveredPeripherals[indexPath.row].name
        return cell
//        let name = self.discoveredPeripherals[indexPath.row].name
//        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellID")!
//        (cell.viewWithTag(1) as! UILabel).text = (name == nil || name == "") ? "Unkown Name" : name
//        retu rn cell
    }
    // MARK 连接蓝牙硬件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //MKAR连接
        let peripheral = self.discoveredPeripherals[indexPath.row]
        self.ble.connect(peripheral, options: nil)
    }
    
    
    

    
    
    
}

