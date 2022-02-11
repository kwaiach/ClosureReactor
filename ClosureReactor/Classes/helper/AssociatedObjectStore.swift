//
//  AssociatedObjectStore.swift
//  APMallSwift
//
//  Created by amore_kwaiach on 2022/01/11.
//  Copyright © 2022 amorepacific.com. All rights reserved.
//

import Foundation

enum AssociatedKey {
  static var reactor = "Reactor"
  static var action = "Action"
  static var renderer = "Renderer"
}

public protocol AssociatedObjectStore {
    func getAssociatedObject<T>(forKey key: UnsafeRawPointer) -> T?
    func getAssociatedObject<T>(forKey key: UnsafeRawPointer, default: T) -> T
    func setAssociatedObject<T>(_ object: T?, forKey key: UnsafeRawPointer)
}

extension AssociatedObjectStore {
    func getAssociatedObject<T>(forKey key: UnsafeRawPointer) -> T? {
        return objc_getAssociatedObject(self, key) as? T
    }
    
    func getAssociatedObject<T>(forKey key: UnsafeRawPointer, default: T) -> T {
        if let object = objc_getAssociatedObject(self, key) as? T {
            return object
        }
        let object = `default`
        setAssociatedObject(object, forKey: key)
        return object
    }
    
    func setAssociatedObject<T>(_ object: T?, forKey key: UnsafeRawPointer) {
        objc_setAssociatedObject(self, key, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
}
