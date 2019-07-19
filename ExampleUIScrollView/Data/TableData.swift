//
//  TableData.swift
//  ExampleUIScrollView
//
//  Created by Massimo Mannoni on 18/07/2019.
//  Copyright © 2019 Massimo Mannoni. All rights reserved.
//

import Foundation
import UIKit

class TableData : NSObject, UITableViewDataSource
{
    private var table: UITableView;
    private var source : DataItem;
    
    init(table: UITableView, source: DataItem) {
        
        // create strong references !!
        self.table = table
        self.source = source
        
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return source.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = UITableViewCell()

        cell.textLabel?.text = String(source.items[indexPath.row])
        
        return cell
    }
}


class TableDelegate: NSObject, UITableViewDelegate {
    
    var homeController: HomeController?
   
}
