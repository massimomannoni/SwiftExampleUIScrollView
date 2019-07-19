//
//  ViewController.swift
//  ExampleUIScrollView
//
//  Created by Massimo Mannoni on 18/07/2019.
//  Copyright © 2019 Massimo Mannoni. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scMain: UIScrollView!
    @IBOutlet weak var pgView: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // assegn as delegate the HomeController inherite from UiscrollViewDelegate
        scMain.delegate = self
        
        
        // setup the scrollview
        setupScrollView()
    }

    private func setupScrollView()
    {
        let viewsToRender = numberOfViews()
        
        print(viewsToRender)
        
        pgView.numberOfPages = viewsToRender
        pgView.currentPage = 0
        
        scMain.contentSize = CGSize(width: view.frame.width * CGFloat(viewsToRender), height: view.frame.height)
        
        addCustomViews(numberOfViews: viewsToRender)
        
    }
    
    private func addCustomViews(numberOfViews: Int)
    {
        var index : Int = 0
        while index <= numberOfViews - 1
        {
            // design runtime frame x view
            let frame =  CGRect(x: self.view.frame.size.width * CGFloat(index), y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
            
            // get random number array as data for tables
            let dataItems = generateRundumNumber()
            
            // design runtime view component passing it's data source
            let customView = CustomView(frame: frame, data: dataItems, controller: self)
            
            scMain.addSubview(customView)
            
            index += 1
        }
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let pageIndex = round(scMain.contentOffset.x/view.frame.width)
        pgView.currentPage = Int(pageIndex)
    }
    
    private func numberOfViews() -> Int
    {
        return Int.random(in: 3..<7)
    }
    
}

extension HomeController
{
    func generateRundumNumber()->DataItem{
        
        var data : DataItem = DataItem()
        
        for _ in 1...10 {
            let randomNumber = Int.random(in: 1..<100)
           data.items.append(randomNumber)
        }
        
        return data
    }
    
}

