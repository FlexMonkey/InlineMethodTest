//
//  ArrayWrapper.swift
//  InlineTest
//
//  Created by Simon Gladman on 02/09/2014.
//  Copyright (c) 2014 Simon Gladman. All rights reserved.
//

import Foundation

struct ArrayWrapper
{
    static internal var staticTestArray = [Double](count: 5000 * 5000, repeatedValue: 123.456);
}