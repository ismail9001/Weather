//
//  Array.swift
//  Weather
//
//  Created by Iskander Nizamov on 02.09.2021.
//

import Foundation

extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}
