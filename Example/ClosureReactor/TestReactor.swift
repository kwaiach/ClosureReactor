//
//  TestReactor.swift
//  ClosureReactor_Example
//
//  Created by amore_kwaiach on 2022/03/03.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import ClosureReactor

struct TestReactor: ClosureReactiveType {
  enum Action {
    case initialize
  }
  
  enum Renderer {
    case update(isInit: Bool)
  }
  
  struct Storage: Mutable {
    var isInit: Bool = true
  }
  
  var storage = Storage()
  var updateHandler: ((Renderer) -> Void)?
  
  init() {
    print(#function)
  }
  
  mutating func action(_ action: Action) {
    print(#function)
    switch action {
      case .initialize:
        defer {
          self.storage = storage.mutate { $0.isInit = false }
        }
        updateHandler?(.update(isInit: storage.isInit))
    }
  }
  
  
}
