//
//  String+Extension.swift
//  JSONConverter
//
//  Created by 姚巍 on 2018/1/28.
//  Copyright © 2018年 姚巍. All rights reserved.
//

import Foundation
extension String {
    
    func propertyName() -> String {
        return lowercaseFirstChar()
    }
    
    func className(withPrefix prefix: String) -> String {
        return prefix + self.uppercaseFirstChar()
    }
    
    func lowercaseFirstChar() -> String {
        if count > 0{
            let range = index(startIndex, offsetBy: 0)..<index(startIndex, offsetBy: 1)
            let firstLowerChar = self[range].lowercased()
//            #if swift(>=4.2)
//            let range = index(startIndex, offsetBy: 0)..<index(startIndex, offsetBy: 1)
//            let firstLowerChar = self[range].lowercased()
//            #else
//            let range = Range(startIndex..<index(startIndex, offsetBy: 1))
//            let firstLowerChar = self[range].lowercased()
//            #endif
            return replacingCharacters(in: range, with: firstLowerChar)
        }else {
            return self
        }
    }
    
    func uppercaseFirstChar() -> String {
        if count > 0{
            let range = index(startIndex, offsetBy: 0)..<index(startIndex, offsetBy: 1)
            let firstLowerChar = self[range].uppercased()
//            #if swift(>=4.2)
//            let range = index(startIndex, offsetBy: 0)..<index(startIndex, offsetBy: 1)
//            let firstLowerChar = self[range].uppercased()
//            #else
//            let range = Range(startIndex..<index(startIndex, offsetBy: 1))
//            let firstLowerChar = self[range].uppercased()
//            #endif
            return replacingCharacters(in: range, with: firstLowerChar)
        }else {
            return self
        }
    }
    
    mutating func removeLastChar() {
        let range = index(endIndex, offsetBy: -1)..<index(endIndex, offsetBy: 0)
//
//        #if swift(>=4.2)
//        let range = index(endIndex, offsetBy: -1)..<index(endIndex, offsetBy: 0)
//        #else
//        let range = Range(self.index(endIndex, offsetBy: -1)..<self.endIndex)
//        #endif
        self.removeSubrange(range)
    }
    
    mutating func removeFistChar() {
        let range = index(startIndex, offsetBy: 0)..<index(startIndex, offsetBy: 1)
//
//        #if swift(>=4.2)
//        let range = index(startIndex, offsetBy: 0)..<index(startIndex, offsetBy: 1)
//        #else
//        let range = Range(self.startIndex..<self.index(startIndex, offsetBy: 1))
//        #endif
        self.removeSubrange(range)
    }

    
    static func numSpace(count: Int) -> String {
        var space = ""
        for _ in 0..<count {
            space += "a"
        }
        
        return space
    }
}

extension NSNumber {
    
    func valueType() -> YWPropertyType {
        let numberType = CFNumberGetType(self as CFNumber)
        var type: YWPropertyType = .Int
        switch numberType{
        case .charType:
            if (self.int32Value == 0 || self.int32Value == 1){
                type = .Bool
            }else{
                assert(true, "遇见Character类型")
            }
        case .shortType, .intType:
            type = .Int
        case .floatType, .float32Type, .float64Type:
            type = .Float
        case .doubleType, .longType:
            type = .Double
        default:
            type = .Int
        }
        
        return type
    }
}
