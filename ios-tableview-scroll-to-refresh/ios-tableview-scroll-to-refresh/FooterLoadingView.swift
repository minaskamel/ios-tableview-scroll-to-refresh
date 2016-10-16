//
//  FooterLoadingView.swift
//  ios-tableview-scroll-to-refresh
//
//  Created by Minas Kamel on 10/16/16.
//  Copyright © 2016 Minas Kamel. All rights reserved.
//

import UIKit

class FooterLoadingView: UIView {
    
    var height : CGFloat!
    var activityIndicatorView : UIActivityIndicatorView!
    
    init(height : CGFloat) {
        self.height = height
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: height))
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicatorView.center = self.center
        activityIndicatorView.autoresizingMask = [.flexibleBottomMargin, .flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin]
        self.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    
    func updateForTableBottomOffset(offset : CGFloat) {
        var newRect = self.frame
        newRect.size.height = height + offset
        self.frame = newRect
    }

}
