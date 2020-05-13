//
//  DownAlamofire.swift
//  QLFileManager
//
//  Created by Mac on 2019/12/18.
//  Copyright © 2019 QinL. All rights reserved.
//

import UIKit
import Alamofire

typealias DownloadProgressClosure = ((_ progress:Float)->Void)
typealias DownloadSuccess = ((_ fileURL: String, _ fileName: String)->Void)
typealias DownloadFailure = ((_ error: Error)->Void)

class DownAlamofire: NSObject {
    static let shared : DownAlamofire = DownAlamofire()
    
    private var cancelledData:Data?
    
    let sessionManager:Alamofire.SessionManager! = {
        let configuration = URLSessionConfiguration.default
        //设置超时时间
        configuration.timeoutIntervalForRequest = 10
        return Alamofire.SessionManager(configuration: configuration)
    }()
    
    let fileURL: URL = {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentURL.appendingPathComponent("QLingFile")
        return fileURL
    }()
    
    //指定下载路径
    let destination:DownloadRequest.DownloadFileDestination = { _, response in
        let fileURL = DownAlamofire.shared.fileURL.appendingPathComponent("\(response.suggestedFilename?.removingPercentEncoding ?? "other")")
        print("文件名称：",response.suggestedFilename?.removingPercentEncoding ?? "","文件大小：",response.expectedContentLength)
        return (fileURL,[.removePreviousFile,.createIntermediateDirectories])
    }
    
    /// 文件下载
    ///
    /// - Parameters:
    ///   - url: 下载url
    ///   - progres: 进度
    ///   - success: 成功返回文件保存路径
    ///   - failure: failure description
    func downRequst(url: String, progress: @escaping DownloadProgressClosure, success: @escaping DownloadSuccess, failure: @escaping DownloadFailure) {
        sessionManager.download(url, to: destination).downloadProgress(closure: { (progres) in
            
            print("完成比例：\(progres.fractionCompleted)")
            print("当前完成：\(progres.completedUnitCount)")
            print("总共大小：\(progres.totalUnitCount)")
            
            progress(Float(progres.fractionCompleted))
        }).responseData { (response) in
            switch response.result {
            case .success(_):
                print("下载成功")
//                print("....", response.destinationURL?.absoluteString.removingPercentEncoding, response.response?.suggestedFilename?.removingPercentEncoding)
                let fileURL = response.destinationURL?.absoluteString.removingPercentEncoding ?? ""
                let fileName = response.response?.suggestedFilename?.removingPercentEncoding ?? ""
                success(fileURL, fileName)
            case .failure(let error):
                print(error)
                failure(error)
            }
        }
    }
    
    
}
