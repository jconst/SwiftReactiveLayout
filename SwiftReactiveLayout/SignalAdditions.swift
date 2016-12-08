//  Created by Joseph Constantakis on 7/3/16.

import Foundation
import ReactiveSwift

public extension CGRect {
  
  public func change(_ block: (inout CGRect) -> ()) -> CGRect {
    var r = self
    block(&r)
    return r
  }
}

public extension SignalProtocol where Value == CGRect {
  public func replaceX(_ xSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return self.combineLatestWith(xSig).map{ (rect, x) in
      return rect.change{ $0.origin.x = x }}
  }
  public func replaceY(_ ySig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(ySig).map{ (rect, y) in
      return rect.change{ $0.origin.y = y }}
  }
  public func replaceRight(_ rightSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(rightSig).map{ (rect, right) in
      return rect.change{ $0.origin.x = right - rect.size.width }}
  }
  public func replaceBottom(_ bottomSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(bottomSig).map{ (rect, bottom) in
      return rect.change{ $0.origin.y = bottom - rect.size.height }}
  }

  public func replaceHeight(_ heightSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(heightSig).map{ (rect, height) in
      return rect.change{ $0.size.height = height }}
  }
  public func replaceWidth(_ widthSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(widthSig).map{ (rect, width) in
      return rect.change{ $0.size.width = width }}
  }
  public func replaceOrigin(_ originSig: Signal<CGPoint, Error>) -> Signal<Value, Error> {
    return combineLatestWith(originSig).map{ (rect, origin) in
      return rect.change{ $0.origin = origin }}
  }
  public func replaceSize(_ sizeSig: Signal<CGSize, Error>) -> Signal<Value, Error> {
    return combineLatestWith(sizeSig).map{ (rect, size) in
      return rect.change{ $0.size = size }}
  }

  public func replaceCenterX(_ centerXSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(centerXSig).map{ (rect, centerX) in
      return rect.change{ $0.origin.x = centerX - (rect.size.width / 2.0) }}
  }
  public func replaceCenterY(_ centerYSig: Signal<CGFloat, Error>) -> Signal<Value, Error> {
    return combineLatestWith(centerYSig).map{ (rect, centerY) in
      return rect.change{ $0.origin.y = centerY - (rect.size.height / 2.0) }}
  }
  public func replaceCenter(_ centerSig: Signal<CGPoint, Error>) -> Signal<Value, Error> {
    return combineLatestWith(centerSig).map{ (rect, center) in
      return rect.change{ $0.origin = CGPointMake(center.x - (rect.size.width / 2.0),
                                                  center.y - (rect.size.height / 2.0)) }
    }
  }
}

public extension SignalProducerProtocol where Value == CGRect {
  public func replaceX(_ xSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceX)(xSig)
  }
  public func replaceY(_ ySig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceY)(ySig)
  }
  public func replaceRight(_ rightSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceRight)(rightSig)
  }
  public func replaceBottom(_ bottomSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceBottom)(bottomSig)
  }

  public func replaceHeight(_ heightSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceHeight)(heightSig)
  }
  public func replaceWidth(_ widthSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceWidth)(widthSig)
  }
  public func replaceOrigin(_ originSig: SignalProducer<CGPoint, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceOrigin)(originSig)
  }
  public func replaceSize(_ sizeSig: SignalProducer<CGSize, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceSize)(sizeSig)
  }

  public func replaceCenterX(_ centerXSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenterX)(centerXSig)
  }
  public func replaceCenterY(_ centerYSig: SignalProducer<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenterY)(centerYSig)
  }
  public func replaceCenter(_ centerSig: SignalProducer<CGPoint, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenter)(centerSig)
  }
}

public extension SignalProducerProtocol where Value == CGRect {
  public func replaceX(_ xSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceX)(xSig)
  }
  public func replaceY(_ ySig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceY)(ySig)
  }
  public func replaceRight(_ rightSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceRight)(rightSig)
  }
  public func replaceBottom(_ bottomSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceBottom)(bottomSig)
  }

  public func replaceHeight(_ heightSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceHeight)(heightSig)
  }
  public func replaceWidth(_ widthSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceWidth)(widthSig)
  }
  public func replaceOrigin(_ originSig: Signal<CGPoint, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceOrigin)(originSig)
  }
  public func replaceSize(_ sizeSig: Signal<CGSize, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceSize)(sizeSig)
  }

  public func replaceCenterX(_ centerXSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenterX)(centerXSig)
  }
  public func replaceCenterY(_ centerYSig: Signal<CGFloat, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenterY)(centerYSig)
  }
  public func replaceCenter(_ centerSig: Signal<CGPoint, Error>) -> SignalProducer<Value, Error> {
    return lift(Signal.replaceCenter)(centerSig)
  }
}
