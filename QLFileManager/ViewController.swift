//
//  ViewController.swift
//  QLFileManager
//
//  Created by Mac on 2019/12/17.
//  Copyright © 2019 QinL. All rights reserved.
//

import UIKit
import SwiftPhotoGallery
import SwiftOverlayShims

public   var style: UIStatusBarStyle = .default //判断状态栏前景颜色

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return style
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
    
    
    
}

