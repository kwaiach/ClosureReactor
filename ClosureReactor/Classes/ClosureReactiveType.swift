//
//  ClosureReactiveType.swift
//  ClosureReactor
//
//  Created by kwaiach on 2022/01/11.
//  Copyright © 2022 kwaiach. All rights reserved.
//

import Foundation

typealias NoAction = Never

public protocol ClosureReactiveType: AssociatedObjectStore {
  associatedtype Action
  associatedtype Renderer
  associatedtype Storage: Mutable
  
  var updateHandler: ((Renderer) -> Void)? { get set }
  var storage: Storage { get set }
  mutating func action(_ action: Action)
}
