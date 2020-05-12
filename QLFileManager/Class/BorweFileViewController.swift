//
//  BorweFileViewController.swift
//  QLFileManager
//
//  Created by Mac on 2019/12/17.
//  Copyright © 2019 QinL. All rights reserved.
//

import UIKit
import QuickLook
import WebKit

class BorweFileViewController: UIViewController {
    private var filesName: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.commonInit()
    }
    
    private func commonInit(){
        self.view.addSubview(table)

        print(path)
        
        let fileManager = FileManager.default
        print(fileManager.fileExists(atPath: path))
        print(fileManager.subpaths(atPath: path) as Any)
        print(fileManager.enumerator(atPath: path)?.allObjects as Any)
        
        self.filesName = fileManager.subpaths(atPath: path) ?? []
        table.reloadData()
    }
    
    private lazy var path: String = {
        let documentPath = NSHomeDirectory() + "/Documents/QinL"
        return documentPath
    }()
    
    private lazy var table: UITableView = {
        let tab = UITableView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: Swidth, height: SheightWithin)), style: .plain)
        tab.delegate = self
        tab.dataSource = self
        tab.backgroundColor = UIColor.white
        return tab
    }()
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension BorweFileViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filesName.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DownloadFileTableViewCell.init(style: .default, reuseIdentifier: "DownloadFileTableViewCell")
        
        
        let size = fileSizeAtPath(path+"/"+self.filesName[indexPath.row])
        print("文件大小：", size)
        
        cell.reloadSource(title: self.filesName[indexPath.row], size: "\(String(format: "%.2f",size))M")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
//        let web = WKWebView.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: Swidth, height: SheightWithin)))
//        web.navigationDelegate = self
//        web.uiDelegate = self
//        self.view.addSubview(web)
//
////        let paths = path+"/"+self.filesName[indexPath.row]
//        let patsh = "https://tz.cqut.edu.cn/system/_content/download.jsp?urltype=news.DownloadAttachUrl&owner=1353704118&wbfileid=2193106&codeValue=8296"
//
//        let requst = URLRequest.init(url: URL.init(string: patsh)!)
//
//        print(requst)
//
//        web.load(requst)
        
        
        let myQlPreViewController = QLPreviewController()
        myQlPreViewController.delegate = self
        myQlPreViewController.dataSource = self
        myQlPreViewController.currentPreviewItemIndex = indexPath.row
        self.navigationController?.pushViewController(myQlPreViewController, animated: true)
    }
    
    //获取单个文件的大小
    func fileSizeAtPath(_ filePath: String) -> Float {
        let manager = FileManager.default
        var fileSize:Float = 0.0
        if manager.fileExists(atPath: filePath) {
            do {
                if let attr: NSDictionary = try manager.attributesOfItem(atPath: filePath) as NSDictionary? {
                    fileSize = Float(attr.fileSize())/(1000.0*1000.0)
                }
            } catch {
                print("Error: \(error)")
            }
        }
        return fileSize;
    }
}

// MARK: - WKNavigationDelegate, WKUIDelegate
extension BorweFileViewController: WKNavigationDelegate, WKUIDelegate{
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("加载完成")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print(keyPath,change,context)
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("加载失败",error)
    }
    
    
}


// MARK: - QLPreviewControllerDelegate, QLPreviewControllerDataSource
extension BorweFileViewController: QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return self.filesName.count
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let url = URL(fileURLWithPath: path+"/"+self.filesName[index])
        return url as QLPreviewItem
    }
}
