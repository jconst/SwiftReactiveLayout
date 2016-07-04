//  Created by Joseph Constantakis on 6/30/16.

import Foundation
import ReactiveCocoa
import enum Result.NoError

public extension UIView {
  public func boundsSignal() -> SignalProducer<CGRect, Result.NoError> {
    return DynamicProperty(object: self, keyPath: "layer.bounds").producer.map { [unowned self] _ in
      self.bounds
    }
  }

  public func frameSignal() -> SignalProducer<CGRect, Result.NoError> {
    let position = DynamicProperty(object: self, keyPath: "layer.position").producer
    return self.boundsSignal().combineLatestWith(position).map { [unowned self] _,_ in
      self.frame
    }
  }
}
