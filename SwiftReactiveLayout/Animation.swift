//  Created by Joseph Constantakis on 7/19/16.

import Foundation
import ReactiveSwift
import Result

public extension SignalProtocol {
  public func animate(_ duration: TimeInterval = 0.2,
                      options: UIViewAnimationOptions = UIViewAnimationOptions.curveEaseInOut)
      -> Signal<Value, Error> {
    return Signal{ obs in
      self.observeResult{ (result: Result<Self.Value, Self.Error>) in
        switch(result) {
          case let .failure(err):
            obs.send(error: err)
          case let .success(value):
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
              obs.send(value: value)
            }, completion: nil)
        }
      }
      return nil
    }
  }
}

public extension SignalProducerProtocol {
  public func animate(_ duration: TimeInterval = 0.2,
                      options: UIViewAnimationOptions = UIViewAnimationOptions(rawValue: 0))
      -> SignalProducer<Value, Error> {
    return lift{ $0.animate(duration, options: options) }
  }
}
