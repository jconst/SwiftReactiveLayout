//  Created by Joseph Constantakis on 7/3/16.

import Foundation
import ReactiveCocoa

public extension CGRect {
  @warn_unused_result(message="Doesn't actually change the rect, just returns a new one")
  public func change(block: (inout CGRect) -> ()) -> CGRect {
    var r = self
    block(&r)
    return r
  }
}

public extension SignalType where Value == CGRect {
  public func replaceX(xSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return self.combineLatestWith(xSig).map{ (rect, x) in
      return rect.change{ $0.origin.x = x }}
  }
  public func replaceY(ySig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(ySig).map{ (rect, y) in
      return rect.change{ $0.origin.y = y }}
  }
  public func replaceRight(rightSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(rightSig).map{ (rect, right) in
      return rect.change{ $0.origin.x = right - rect.size.width }}
  }
  public func replaceBottom(bottomSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(bottomSig).map{ (rect, bottom) in
      return rect.change{ $0.origin.y = bottom - rect.size.height }}
  }

  public func replaceHeight(heightSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(heightSig).map{ (rect, height) in
      return rect.change{ $0.size.height = height }}
  }
  public func replaceWidth(widthSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(widthSig).map{ (rect, width) in
      return rect.change{ $0.size.width = width }}
  }
  public func replaceOrigin(originSig: Signal<CGPoint, Error>) -> Signal<Value, Error> {
    return combineLatestWith(originSig).map{ (rect, origin) in
      return rect.change{ $0.origin = origin }}
  }
  public func replaceSize(sizeSig: Signal<CGSize, Error>) -> Signal<Value, Error> {
    return combineLatestWith(sizeSig).map{ (rect, size) in
      return rect.change{ $0.size = size }}
  }

  public func replaceCenterX(centerXSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(centerXSig).map{ (rect, centerX) in
      return rect.change{ $0.origin.x = centerX - (rect.size.width / 2.0) }}
  }
  public func replaceCenterY(centerYSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(centerYSig).map{ (rect, centerY) in
      return rect.change{ $0.origin.y = centerY - (rect.size.height / 2.0) }}
  }
  public func replaceCenter(centerSig: Signal<CGPoint, Error>) -> Signal<Value, Error> {
    return combineLatestWith(centerSig).map{ (rect, center) in
      return rect.change{ $0.origin = CGPointMake(center.x - (rect.size.width / 2.0),
                                                  center.y - (rect.size.height / 2.0)) }
    }
  }
}

public extension SignalProducerType where Value == CGRect {
  public func replaceX(xSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceX)(xSig)
  }
  public func replaceY(ySig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceY)(ySig)
  }
  public func replaceRight(rightSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceRight)(rightSig)
  }
  public func replaceBottom(bottomSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceBottom)(bottomSig)
  }

  public func replaceHeight(heightSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceHeight)(heightSig)
  }
  public func replaceWidth(widthSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceWidth)(widthSig)
  }
  public func replaceOrigin(originSig: SignalProducer<CGPoint, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceOrigin)(originSig)
  }
  public func replaceSize(sizeSig: SignalProducer<CGSize, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceSize)(sizeSig)
  }

  public func replaceCenterX(centerXSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenterX)(centerXSig)
  }
  public func replaceCenterY(centerYSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenterY)(centerYSig)
  }
  public func replaceCenter(centerSig: SignalProducer<CGPoint, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenter)(centerSig)
  }
}

public extension SignalProducerType where Value == CGRect {
  public func replaceX(xSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceX)(xSig)
  }
  public func replaceY(ySig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceY)(ySig)
  }
  public func replaceRight(rightSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceRight)(rightSig)
  }
  public func replaceBottom(bottomSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceBottom)(bottomSig)
  }

  public func replaceHeight(heightSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceHeight)(heightSig)
  }
  public func replaceWidth(widthSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceWidth)(widthSig)
  }
  public func replaceOrigin(originSig: Signal<CGPoint, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceOrigin)(originSig)
  }
  public func replaceSize(sizeSig: Signal<CGSize, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceSize)(sizeSig)
  }

  public func replaceCenterX(centerXSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenterX)(centerXSig)
  }
  public func replaceCenterY(centerYSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenterY)(centerYSig)
  }
  public func replaceCenter(centerSig: Signal<CGPoint, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenter)(centerSig)
  }
}
