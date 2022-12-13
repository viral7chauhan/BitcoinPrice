//
//  Log+helper.swift
//  BitCoinPrice
//
//  Created by Viral on 14/12/22.
//

import Foundation

func log(_ s: Any, line: Int = #line) {
    let fileName = (#file as NSString).lastPathComponent
    print("\(fileName) > line: \(line)", s)
}
