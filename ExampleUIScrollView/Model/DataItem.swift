//
//  DataItem.swift
//  ExampleUIScrollView
//
//  Created by Massimo Mannoni on 18/07/2019.
//  Copyright © 2019 Massimo Mannoni. All rights reserved.
//

import Foundation

struct DataItem  {
    
    var items = [Int]()
    
    init() {
        items = []
    }
    
    init(number : Int) {
        self.items.append(number)
    }
}
