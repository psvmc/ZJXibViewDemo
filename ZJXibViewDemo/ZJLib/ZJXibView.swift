//
//  ZJXibView.swift
//  ZJXibViewDemo
//
//  Created by 张剑 on 2016/11/4.
//  Copyright © 2016年 张剑. All rights reserved.
//

import UIKit

@objc class ZJXibView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.loadView()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.bounds
    }
    
    fileprivate func getXibName() -> String {
        let clzzName = NSStringFromClass(self.classForCoder)
        let nameArray = clzzName.components(separatedBy: ".")
        var xibName = nameArray[0]
        if nameArray.count == 2 {
            xibName = nameArray[1]
        }
        return xibName
    }
    
    
    func loadView() {
        if self.contentView != nil {
            return
        }
        let nibs = Bundle.main.loadNibNamed(getXibName(), owner: self, options: nil)
        self.contentView = nibs![0] as! UIView
        self.contentView.frame = self.bounds
        self.contentView.backgroundColor = UIColor.clear
        self.addSubview(self.contentView)
    }
}
