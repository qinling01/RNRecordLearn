//
//  DownloadFileTableViewCell.swift
//  QLFileManager
//
//  Created by Mac on 2019/12/19.
//  Copyright © 2019 QinL. All rights reserved.
//

import UIKit

class DownloadFileTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        self.commonInit()
    }
    
    private func commonInit(){
        self.contentView.addSubview(titleLb)
        self.contentView.addSubview(sizeLb)
    }
    
    private lazy var titleLb: UILabel = {
        let lb = UILabel()
        lb.textColor  = UIColor.black
        lb.font = UIFont.systemFont(ofSize: 16)
        return lb
    }()
    
    private lazy var sizeLb: UILabel = {
        let lb = UILabel()
        lb.textAlignment = .right
        lb.textColor  = UIColor.black
        lb.font = UIFont.systemFont(ofSize: 16)
        return lb
    }()
    
    func reloadSource(title: String?, size: String?) {
        self.titleLb.text = title
        self.sizeLb.text = size
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLb.frame = CGRect.init(origin: CGPoint.init(x: 10, y: 0), size: CGSize.init(width: 250, height: 30))
        self.titleLb.center.y = self.frame.size.height / 2
        
        self.sizeLb.frame = CGRect.init(origin: CGPoint.init(x: self.frame.size.width-90, y: 0), size: CGSize.init(width: 80, height: 30))
        self.sizeLb.center.y = self.frame.size.height / 2
    }
}
