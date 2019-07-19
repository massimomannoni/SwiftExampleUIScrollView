//
//  CustomView.swift
//  ExampleUIScrollView
//
//  Created by Massimo Mannoni on 18/07/2019.
//  Copyright © 2019 Massimo Mannoni. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var tbData: UITableView!
    @IBOutlet weak var customView: UIView!
    
    private var tableDelegate : TableDelegate!
    private var tableData : TableData!
    private var controller : HomeController!
    
    private var dataItems : DataItem!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(frame: CGRect, data : DataItem, controller : HomeController){
        
        super.init(frame: frame)
        
        self.dataItems = data
        self.controller = controller
        
        RegisterXib()
        
        ConfigTable()
    }
    
    private func RegisterXib() {
        let xibCustomView = UINib(nibName: "CustomView", bundle: nil)
        xibCustomView.instantiate(withOwner: self, options: nil)
        customView.frame = bounds
        addSubview(customView)
    }
    
    private func ConfigTable()
    {
        tableDelegate = TableDelegate()
        tableDelegate.homeController = self.controller

        tableData = TableData(table: tbData, source: dataItems)
        
        tbData.dataSource = tableData
        tbData.delegate = tableDelegate
    }
}


