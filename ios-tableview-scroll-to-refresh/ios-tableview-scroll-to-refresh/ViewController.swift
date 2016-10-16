//
//  ViewController.swift
//  ios-tableview-scroll-to-refresh
//
//  Created by Minas Kamel on 10/15/16.
//  Copyright © 2016 Minas Kamel. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var rowCount = 0
    var loading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNextBatch()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "row: #\(indexPath.row + 1)"
        return cell
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollView = self.tableView
        let offset = scrollView?.contentOffset
        let bounds = scrollView?.bounds
        let size = scrollView?.contentSize
        let inset = scrollView?.contentInset
        let y = (offset?.y)! + (bounds?.size.height)! - (inset?.bottom)!
        let distance = y - (size?.height)!
        if distance > 0.00 && !loading {
            footerLoadingView?.updateForTableBottomOffset(offset: distance)
            loadNextBatch()
        }
    }
    
    func loadNextBatch() {
        loading = true
        if footerLoadingView == nil {
            addFooterActivityIndicatorWithHeight(height: 40)
        }
        
        if rowCount < 60 {
            let deadline = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
                self.addNewData()
            })
        } else {
            removeFooterLoadingView()
        }
    }
    
    func addNewData() {
        rowCount += 15
        tableView.reloadData()
        loading = false
    }
    
    
}

