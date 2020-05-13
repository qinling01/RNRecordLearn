//
//  DownloadFileViewController.swift
//  QLFileManager
//
//  Created by Mac on 2019/12/17.
//  Copyright © 2019 QinL. All rights reserved.
//

import UIKit
import Alamofire
import QuickLook

class DownloadFileViewController: UIViewController {
    
    @IBOutlet weak var progress: UIProgressView!
    
    @IBOutlet weak var progresst: UIProgressView!
    
    /// 文件名称
    private var fileName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.commonInit()
    }
    
    private func commonInit(){
        
    }
    
    @IBAction func downBtn(_ sender: Any) {
//        let url1 = "https://obs-course.obs.cn-east-2.myhwclouds.com/develop_guide_simple_form.mp4"
        let url1 = "http://119.3.199.152/zhjy/graduate/agreement/generate?staffCode=100002"
        
        let downLoader = DownLoader()
        
        let url = NSURL(string: url1)
        downLoader.downLoader(url: url!)
    }
    
    @IBAction func downloadtBtn(_ sender: Any) {
//        let url2 = "http://app.ncvt.net/hall/aws/portal/r/df?groupValue=ce119c7b-2682-4440-847a-dd6be3f0561e&fileValue=ENCLOSURE&sid=f09a4241-100e-46a5-952f-197c5ea90931X0lbYXdzNTNdSV8&repositoryName=%21form-ui-file-&appId=com.awspaas.user.apps.ncvtoa&attachment=true&fileName=%E5%8D%97%E8%81%8C%E5%AE%A3%E5%8F%91%E3%80%942019%E3%80%9566%E5%8F%B7++%E5%85%B3%E4%BA%8E%E5%9C%A8%E5%85%A8%E6%A0%A1%E6%B7%B1%E5%85%A5%E5%BC%80%E5%B1%95%E5%90%91%E5%8D%A2%E6%B0%B8%E6%A0%B9%E5%90%8C%E5%BF%97%E5%AD%A6%E4%B9%A0%E7%9A%84%E9%80%9A%E7%9F%A5.pdf&lastModified=1576490940000&mobileAttachment=true"
//        let url2 = "http://app.ncvt.net/hall/aws/portal/r/df?groupValue=7389c1f0-79c6-4fbf-81ae-de3c2ddc1e9f&fileValue=ENCLOSURE&sid=56886190-0869-4359-95a3-1b5bdaafcbf1X0lbYXdzNTJdSV8&repositoryName=%21form-ui-file-&appId=com.awspaas.user.apps.ncvtoa&attachment=true&fileName=%E9%99%84%E4%BB%B62%EF%BC%9A%E7%94%B3%E6%8A%A5%E6%B5%81%E7%A8%8B%E5%8F%8A%E8%A6%81%E6%B1%82.rar&lastModified=1576718234000&mobileAttachment=true"
//        let url2 = "http://app.ncvt.net/hall/aws/portal/r/df?groupValue=17074a4d-a2a9-4e18-a35d-91840480776f&fileValue=ENCLOSURE&sid=45b224c4-6c07-4a0e-ba36-4fb687c79fa1X0lbYXdzNTNdSV8&repositoryName=%21form-ui-file-&appId=com.awspaas.user.apps.ncvtoa&attachment=true&fileName=gradlew.zip&lastModified=1576827321000&mobileAttachment=true"
        
//        let url2 = "https://www.bookben.net/down/all/34096.txt"
        
        let url2 = "https://obs-course.obs.cn-east-2.myhwclouds.com/develop_guide_simple_form.mp4"
        
//        let url2 = "http://image.baidu.com/search/detail?ct=503316480&z=undefined&tn=baiduimagedetail&ipn=d&word=pdf%E6%96%87%E4%BB%B6&step_word=&ie=utf-8&in=&cl=2&lm=-1&st=undefined&hd=undefined&latest=undefined&copyright=undefined&cs=2064453123,1577414812&os=4268566813,2162579744&simid=3435058845,315318747&pn=1&rn=1&di=101090&ln=1949&fr=&fmq=1584439706937_R&fm=&ic=undefined&s=undefined&se=&sme=&tab=0&width=undefined&height=undefined&face=undefined&is=0,0&istype=0&ist=&jit=&bdtype=0&spn=0&pi=0&gsm=0&objurl=http%3A%2F%2Fe.hiphotos.baidu.com%2Fexp%2Fw%3D500%2Fsign%3D623ab5060c3387449cc52f7c610fd937%2Fb3b7d0a20cf431ad5ff1a86f4b36acaf2edd9841.jpg&rpstart=0&rpnum=0&adpicid=0&force=undefined"
        
//        let url2 = "https://tz.cqut.edu.cn/system/_content/download.jsp?urltype=news.DownloadAttachUrl&owner=1353704118&wbfileid=2193106&codeValue=8296"
//        let url2 = "http://119.3.199.152/zhjy/graduate/agreement/generate?staffCode=100002"
        
        
//        let configuration = KVNProgressConfiguration.default()
//        configuration?.backgroundTintColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1)
//        configuration?.backgroundFillColor = UIColor.init(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.1)
//        configuration?.backgroundType = .blurred
//        configuration?.circleFillBackgroundColor = UIColor.init(red: 255.0, green: 255.0, blue: 255.0, alpha: 0.1)
//        configuration?.circleStrokeBackgroundColor = UIColor.lightGray
//        configuration?.circleStrokeForegroundColor = UIColor.green
//        configuration?.circleSize = 50.0
//        configuration?.lineWidth = 3
//        KVNProgress.setConfiguration(configuration)
//        KVNProgress.show(0.1)
        
        DownAlamofire.shared.downRequst(url: url2, progress: { (progress) in
            print("------------------：",progress)
            
            self.progresst.progress = progress
            
            
            
            
        }, success: { (fileURL, fileName) in
            print("文件路径:",fileURL,fileName)
            self.fileName = fileName
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1.0, execute: {
//                KVNProgress.dismiss()
                
                let myQlPreViewController = QLPreviewController()
                myQlPreViewController.delegate = self
                myQlPreViewController.dataSource = self
                self.navigationController?.pushViewController(myQlPreViewController, animated: true)
            })
            
            
        }) { (error) in
            print(error)
        }
        
        
//        let downLoader = DownLoader()
//
//        let url = NSURL(string: url2)
//        downLoader.downLoader(url: url!)
    }
    
    /// 浏览文件
    ///
    /// - Parameter fileURL: 文件l路径
    private func browseDocuments(fileURL: String){
        
    }
    
    deinit {
        print("...............")
    }
    
}

// MARK: - QLPreviewControllerDelegate, QLPreviewControllerDataSource
extension DownloadFileViewController: QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let url = DownAlamofire.shared.fileURL.appendingPathComponent(fileName)
        return url as QLPreviewItem
    }
}
