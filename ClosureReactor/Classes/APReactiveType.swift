//
//  APReactiveType.swift
//  APMallSwift
//
//  Created by amore_kwaiach on 2022/01/11.
//  Copyright © 2022 amorepacific.com. All rights reserved.
//

import Foundation

typealias NoAction = Never

protocol APReactiveType: AssociatedObjectStore {
  associatedtype Action
  associatedtype Renderer
  associatedtype Storage: Mutable
  
  var updateHandler: ((Renderer) -> Void)? { get set }
  var storage: Storage { get set }
  mutating func action(_ action: Action)
}
