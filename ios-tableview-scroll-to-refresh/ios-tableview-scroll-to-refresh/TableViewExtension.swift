//
//  TableViewExtension.swift
//  ios-tableview-scroll-to-refresh
//
//  Created by Minas Kamel on 10/16/16.
//  Copyright © 2016 Minas Kamel. All rights reserved.
//

import UIKit


extension UITableViewController {

    var footerLoadingView : FooterLoadingView? {
        get {
            if self.tableView.tableFooterView is FooterLoadingView {
                return self.tableView.tableFooterView as? FooterLoadingView
            } else {
                return nil
            }
        }
    }
    
    func addFooterActivityIndicatorWithHeight(height : CGFloat) {
        let footerLoadingView = FooterLoadingView(height: height)
        self.tableView.tableFooterView = footerLoadingView
    }
    
    func removeFooterLoadingView() {
        footerLoadingView?.removeFromSuperview()
        self.tableView.tableFooterView = nil
    }

    
}
