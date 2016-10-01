//  Created by Joseph Constantakis on 7/19/16.

import Foundation
import ReactiveCocoa

public extension SignalType {
  public func animate(_ duration: NSTimeInterval = 0.2,
                      options: UIViewAnimationOptions = UIViewAnimationOptions.CurveEaseInOut)
      -> Signal<Value, Error> {
    return Signal{ obs in
      self.observeNext{ next in
        UIView.animateWithDuration(duration, delay: 0, options: options, animations: {
          obs.sendNext(next)
        }, completion: nil)
      }
      return nil
    }
  }
}

public extension SignalProducerType {
  public func animate(_ duration: NSTimeInterval = 0.2,
                      options: UIViewAnimationOptions = UIViewAnimationOptions(rawValue: 0))
      -> SignalProducer<Value, Error> {
    return lift{ $0.animate(duration, options: options) }
  }
}
