//
//  ClosureReactiveViewType.swift
//  ClosureReactor
//
//  Created by kwaiach on 2022/01/11.
//  Copyright © 2022 kwaiach. All rights reserved.
//

import Foundation
import UIKit

public protocol ClosureReactiveViewType: AnyObject, AssociatedObjectStore {
  associatedtype Reactor: ClosureReactiveType
  typealias Action = Reactor.Action
  typealias Renderer = Reactor.Renderer
  var reactor: Reactor? { get set }
  func update(_ renderer: Renderer)
}

extension ClosureReactiveViewType where Self: UIViewController {
  var reactor: Reactor? {
    get {
      getAssociatedObject(forKey: &AssociatedKey.reactor)
    }
    set {
      guard let reactor = newValue else { return }
      setAssociatedObject(reactor, forKey: &AssociatedKey.reactor)
      bind()
    }
  }
  
  private func bind() {
    DispatchQueue.main.async { [weak self] in
      guard let self = self else { return }
      self.reactor?.updateHandler = self.update
    }
  }
}
