//  Created by Joseph Constantakis on 6/30/16.

import Foundation
import ReactiveCocoa
import enum Result.NoError

private var boundsSignalKey = ()
private var frameSignalKey = ()
private var framePropKey = ()

public extension UIView {
  var boundsSignal: SignalProducer<CGRect, Result.NoError> { get{
    return lazyProperty(&boundsSignalKey) {
      return DynamicProperty(object: self, keyPath: "layer.bounds").producer.map { [unowned self] _ in
        self.bounds
      }
    }
  }}

  var frameSignal: SignalProducer<CGRect, Result.NoError> { get{
    return lazyProperty(&frameSignalKey) { [unowned self] in
      let position = DynamicProperty(object: self, keyPath: "layer.position").producer
      return self.boundsSignal.combineLatestWith(position).map { [unowned self] _,_ in
        self.frame
      }
    }
  }}

  var frameProp: MutableProperty<CGRect> { get{
    return lazyProperty(&framePropKey) {
      let prop = MutableProperty(self.frame)
      prop.signal.observeNext {
        self.frame = $0
      }
      return prop
    }
  }}
}
