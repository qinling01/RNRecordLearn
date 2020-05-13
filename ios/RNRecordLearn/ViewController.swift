//
//  ViewController.swift
//  RNRecordLearn
//
//  Created by Mac on 2019/12/17.
//  Copyright © 2019 QinL. All rights reserved.
//

import UIKit

public   var style: UIStatusBarStyle = .default //判断状态栏前景颜色

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.commoInit()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return style
    }
    
    private func commoInit(){
        
    }
}

