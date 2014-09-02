//
//  ViewController.swift
//  InlineTest
//
//  Created by Simon Gladman on 02/09/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        var testArray = [Double](count: 5000 * 5000, repeatedValue: 123.456);
        
        var startTime : CFAbsoluteTime?;
        
        let writeToArray = true;
        
        var inlineTotal : Double = 0;
        var instanceTotal : Double = 0;
        var classTotal : Double = 0;
        var inlineOnStatic : Double = 0;
        var instanceOnStatic : Double = 0;
        var classOnStatic : Double = 0;
        
        for _ in 0...3
        {
            println("...")
            
            startTime = CFAbsoluteTimeGetCurrent();
            
            for var i = 1; i < 5000 - 1; i++
            {
                for var j = 1; j < 5000 - 1; j++
                {
                    let index = i + 5000 * j
                    let left = (i - 1) + 5000 * j
                    let right = (i + 1) + 5000 * j
                    let top = (i + 1) + 5000 * j
                    let bottom = i + 5000 * (j + 1)
                    
                    let north = testArray[top]
                    let south = testArray[bottom]
                    let east = testArray[left]
                    let west = testArray[right]
                    
                    let total = north + south + east + west;
                    
                    if writeToArray
                    {
                        testArray[index] = 123.456;
                    }
                }
            }
            
            inlineTotal += CFAbsoluteTimeGetCurrent() - startTime!;
            
            // instance method
            
            startTime = CFAbsoluteTimeGetCurrent();
            
            for var i = 1; i < 5000 - 1; i++
            {
                for var j = 1; j < 5000 - 1; j++
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
                    
                    if writeToArray
                    {
                        testArray[index] = 123.456;
                    }
                }
            }
            
            instanceTotal += CFAbsoluteTimeGetCurrent() - startTime!;
            
            // class method
            
            startTime = CFAbsoluteTimeGetCurrent();
            
            for var i = 1; i < 5000 - 1; i++
            {
                for var j = 1; j < 5000 - 1; j++
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
                    
                    if writeToArray
                    {
                        testArray[index] = 123.456;
                    }
                }
            }
            
            classTotal += CFAbsoluteTimeGetCurrent() - startTime!;
            
            // inline on static array
            
            startTime = CFAbsoluteTimeGetCurrent();
            
            for var i = 1; i < 5000 - 1; i++
            {
                for var j = 1; j < 5000 - 1; j++
                {
                    let index = i + 5000 * j
                    let left = (i - 1) + 5000 * j
                    let right = (i + 1) + 5000 * j
                    let top = (i + 1) + 5000 * j
                    let bottom = i + 5000 * (j + 1)
                    
                    let north = ArrayWrapper.staticTestArray[top]
                    let south = ArrayWrapper.staticTestArray[bottom]
                    let east = ArrayWrapper.staticTestArray[left]
                    let west = ArrayWrapper.staticTestArray[right]
                    
                    let total = north + south + east + west;
                    
                    if writeToArray
                    {
                        testArray[index] = 123.456;
                    }
                }
            }
            
            inlineOnStatic += CFAbsoluteTimeGetCurrent() - startTime!;
            
            // instance method on static array
            
            startTime = CFAbsoluteTimeGetCurrent();
            
            for var i = 1; i < 5000 - 1; i++
            {
                for var j = 1; j < 5000 - 1; j++
                {
                    let index = getIndex(i, j: j)
                    let left = getIndex(i - 1, j: j)
                    let right = getIndex(i + 1, j: j)
                    let top = getIndex(i, j: j -  1)
                    let bottom = getIndex(i, j: j + 1)
                    
                    let north = ArrayWrapper.staticTestArray[top]
                    let south = ArrayWrapper.staticTestArray[bottom]
                    let east = ArrayWrapper.staticTestArray[left]
                    let west = ArrayWrapper.staticTestArray[right]
                    
                    let total = north + south + east + west;
                    
                    if writeToArray
                    {
                        testArray[index] = 123.456;
                    }
                }
            }
            
            instanceOnStatic += CFAbsoluteTimeGetCurrent() - startTime!;
            
            // class method on static array
            
            startTime = CFAbsoluteTimeGetCurrent();
            
            for var i = 1; i < 5000 - 1; i++
            {
                for var j = 1; j < 5000 - 1; j++
                {
                    let index = ViewController.staticGetIndex(i, j: j)
                    let left = ViewController.staticGetIndex(i - 1, j: j)
                    let right = ViewController.staticGetIndex(i + 1, j: j)
                    let top = ViewController.staticGetIndex(i, j: j -  1)
                    let bottom = ViewController.staticGetIndex(i, j: j + 1)
                    
                    let north = ArrayWrapper.staticTestArray[top]
                    let south = ArrayWrapper.staticTestArray[bottom]
                    let east = ArrayWrapper.staticTestArray[left]
                    let west = ArrayWrapper.staticTestArray[right]
                    
                    let total = north + south + east + west;
                    
                    if writeToArray
                    {
                        testArray[index] = 123.456;
                    }
                }
            }
            
            classOnStatic += CFAbsoluteTimeGetCurrent() - startTime!
        }
        
        println("Inline Method:" + NSString(format: "%.4f", inlineTotal))
        println("Instance Method:" + NSString(format: "%.4f", instanceTotal))
        println("Class Method:" + NSString(format: "%.4f", classTotal))
        println("Inline on Static Array:" + NSString(format: "%.4f", inlineOnStatic))
        println("Instance on Static Array:" + NSString(format: "%.4f", instanceOnStatic))
        println("Class Method on Static Array:" + NSString(format: "%.4f", classOnStatic))
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getIndex(i : Int, j : Int) -> Int
    {
        return i + (5000) * j;
    }
    
    class func staticGetIndex(i : Int, j : Int) -> Int
    {
        
        return i + (5000) * j;
    }
    
}

