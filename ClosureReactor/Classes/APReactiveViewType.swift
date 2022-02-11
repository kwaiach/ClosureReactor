//
//  APReactiveViewType.swift
//  APMallSwift
//
//  Created by amore_kwaiach on 2022/01/11.
//  Copyright © 2022 amorepacific.com. All rights reserved.
//

import Foundation
import UIKit

protocol APReactiveViewType: AnyObject, AssociatedObjectStore {
  associatedtype Reactor: APReactiveType
  typealias Action = Reactor.Action
  typealias Renderer = Reactor.Renderer
  var reactor: Reactor? { get set }
  func update(_ renderer: Renderer)
}

extension APReactiveViewType where Self: UIViewController {
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
