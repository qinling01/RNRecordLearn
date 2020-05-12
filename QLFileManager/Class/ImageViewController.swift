//
//  ImageViewController.swift
//  QLFileManager
//
//  Created by Mac on 2019/12/27.
//  Copyright © 2019 QinL. All rights reserved.
//

import UIKit
import SwiftPhotoGallery

class ImageViewController: UIViewController {

    @IBOutlet weak var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.barTintColor = UIColor.orange
        
        self.commonInit()
    }
    
    private func commonInit(){
        self.icon.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(touchIcon(_:)))
        self.icon.addGestureRecognizer(tap)
    }
    
    @objc func touchIcon(_ tap: UITapGestureRecognizer){
        
        
//        if let navigationBar = self.navigationController?.navigationBar {
//            // 切换导航栏样式
//            navigationBar.barStyle = .black
//        }
        
        
        let gallery = SwiftPhotoGallery(delegate: self, dataSource: self)
        gallery.backgroundColor = UIColor.black
        gallery.pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
        gallery.currentPageIndicatorTintColor = UIColor.white
        gallery.hidePageControl = true
        gallery.hideStatusBar = false
        present(gallery, animated: true, completion: nil)
    }
}

extension ImageViewController: SwiftPhotoGalleryDataSource, SwiftPhotoGalleryDelegate {
    func numberOfImagesInGallery(gallery: SwiftPhotoGallery) -> Int {
        return 1
    }
    
    func imageInGallery(gallery: SwiftPhotoGallery, forIndex: Int) -> UIImage? {
        return self.icon.image
    }
    
    func galleryDidTapToClose(gallery: SwiftPhotoGallery) {
        dismiss(animated: true, completion: nil)
    }
}
