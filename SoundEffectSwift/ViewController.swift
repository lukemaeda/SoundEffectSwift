//
//  ViewController.swift
//  SoundEffectSwift
//
//  Created by MAEDAHAJIME on 2015/07/08.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    // システムサウンド
    var _ssId01:SystemSoundID = 0
    var _ssId02:SystemSoundID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 準備処理
        doReady()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // [#01]ボタン押した時
    @IBAction func play01(sender: UIButton) {
        println("サウンド3")
        AudioServicesPlaySystemSound(_ssId01)
    }

    // [#02]ボタン押した時
    @IBAction func play02(sender: UIButton) {
        println("サウンド４")
        AudioServicesPlaySystemSound(_ssId02)
    }
    
    // [振動]ボタン押した時
    @IBAction func vibtate(sender: UIButton) {
        println("サウンド５")
        // バイブレーション
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    // 準備処理
    func doReady(){
        
        println("サウンド")
        
        // 音楽ファイルの参照
        let bnd:NSBundle = NSBundle.mainBundle()
        
        // 設定#01
        let url01 = NSURL(fileURLWithPath: NSBundle.mainBundle()
            .pathForResource("mp01", ofType: "mp3")!)
        
        AudioServicesCreateSystemSoundID(url01, &_ssId01)
        AudioServicesPlaySystemSound ( _ssId01 )
        
        // 設定#02
        let url02 = NSURL(fileURLWithPath: NSBundle.mainBundle()
            .pathForResource("mp02", ofType: "mp3")!)
        
        AudioServicesCreateSystemSoundID(url02, &_ssId02)
        AudioServicesPlaySystemSound ( _ssId02 )
        
        println("サウンド2")
    }
    
}
