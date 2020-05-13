//
//  ViewController.swift
//  RNRecordLearn
//
//  Created by Mac on 2019/12/17.
//  Copyright © 2019 QinL. All rights reserved.
//

import UIKit
import React

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
    
    /// 下载文件
    ///
    /// - Parameter sender: sender description
    @IBAction func downloadFile(_ sender: Any) {
        
    }
    
    /// 浏览文件
    ///
    /// - Parameter sender: sender description
    @IBAction func borwseFile(_ sender: Any) {
        
    }
    
    /// 图片浏览
    ///
    /// - Parameter sender: sender description
    @IBAction func imageBrowse(_ sender: Any) {
        
    }
    
    /// RN链接跳转
    /// - Parameter sender: sender description
    @IBAction func RNLearnPush(_ sender: Any) {
//        let jsCodeLocation: URL = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
        let mockData: [AnyHashable : Any] = ["scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]
        
        let jsCodeLocation2: URL = Bundle.main.url(forResource: "main", withExtension: "jsbundle")!
        
        let rootView = RCTRootView(bundleURL: jsCodeLocation2, moduleName: "RNHighScores", initialProperties: mockData, launchOptions: nil)
        let rnLear = RNLearToolController()
        rnLear.view = rootView
        self.navigationController?.pushViewController(rnLear, animated: true)
    }
}

