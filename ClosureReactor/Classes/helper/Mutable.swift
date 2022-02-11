//
//  Mutable.swift
//  APReactor
//
//  Created by amore_kwaiach on 2022/02/10.
//

import Foundation

public protocol Mutable {
    func mutate(_ block: @escaping (inout Self) -> Void) -> Self
}

public extension Mutable {
    func mutate(_ block: @escaping (inout Self) -> Void) -> Self {
        var copy = self
        block(&copy)
        return copy
    }
}
