//
//  TestViewController.swift
//  ClosureReactor
//
//  Created by kwaiach on 02/11/2022.
//  Copyright (c) 2022 kwaiach. All rights reserved.
//

import UIKit
import ClosureReactor

class TestViewController: UIViewController, ClosureReactiveViewType {
  typealias Reactor = TestReactor
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(#function)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print(#function)
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    print(#function)
    reactor?.action(.initialize)
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { [weak self] in
      self?.reactor?.action(.initialize)
    }
  }
  
  func update(_ renderer: Renderer) {
    print(#function)
    switch renderer {
      case .update(let isInit):
        let color = isInit ? UIColor.yellow : UIColor.green
        self.view.backgroundColor = color
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

