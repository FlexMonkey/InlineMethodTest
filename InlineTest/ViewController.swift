//
//  ViewController.swift
//  InlineTest
//
//  Created by Simon Gladman on 02/09/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let GRID_WIDTH : Int = 5000
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let testArray = [Double](count: GRID_WIDTH * GRID_WIDTH, repeatedValue: 123.456);
        
        var startTime : CFAbsoluteTime = CFAbsoluteTimeGetCurrent();
        
        for var i = 1; i < GRID_WIDTH - 1; i++
        {
            for var j = 1; j < GRID_WIDTH - 1; j++
            {
                let index = i + GRID_WIDTH * j
                let left = getIndex(i - 1, j: j)
                let right = (i - 1) + GRID_WIDTH * j
                let top = (i + 1) + GRID_WIDTH * j
                let bottom = i + GRID_WIDTH * (j + 1)
                
                let north = testArray[top]
                let south = testArray[bottom]
                let east = testArray[left]
                let west = testArray[right]
                
                let total = north + south + east + west;
            }
        }
        
        println("Inline:" + NSString(format: "%.4f", CFAbsoluteTimeGetCurrent() - startTime));
        
        // instance method
        
        startTime = CFAbsoluteTimeGetCurrent();
        
        for var i = 1; i < GRID_WIDTH - 1; i++
        {
            for var j = 1; j < GRID_WIDTH - 1; j++
            {
                let index = getIndex(i, j: j)
                let left = getIndex(i - 1, j: j)
                let right = getIndex(i + 1, j: j)
                let top = getIndex(i, j: j -  1)
                let bottom = getIndex(i, j: j + 1)
                
                let north = testArray[top]
                let south = testArray[bottom]
                let east = testArray[left]
                let west = testArray[right]
                
                let total = north + south + east + west;
            }
        }
        
        println("Instance Method:" + NSString(format: "%.4f", CFAbsoluteTimeGetCurrent() - startTime));
        
        // class method
        
        startTime = CFAbsoluteTimeGetCurrent();
        
        for var i = 1; i < GRID_WIDTH - 1; i++
        {
            for var j = 1; j < GRID_WIDTH - 1; j++
            {
                let index = ViewController.staticGetIndex(i, j: j)
                let left = ViewController.staticGetIndex(i - 1, j: j)
                let right = ViewController.staticGetIndex(i + 1, j: j)
                let top = ViewController.staticGetIndex(i, j: j -  1)
                let bottom = ViewController.staticGetIndex(i, j: j + 1)
                
                let north = testArray[top]
                let south = testArray[bottom]
                let east = testArray[left]
                let west = testArray[right]
                
                let total = north + south + east + west;
            }
        }
        
        println("Class Method:" + NSString(format: "%.4f", CFAbsoluteTimeGetCurrent() - startTime));
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func getIndex(i : Int, j : Int) -> Int
    {
        return i + (GRID_WIDTH) * j;
    }
    
    class func staticGetIndex(i : Int, j : Int) -> Int
    {
        
        return i + (1000) * j;
    }

}

