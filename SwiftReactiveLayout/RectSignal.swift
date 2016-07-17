//  Created by Joseph Constantakis on 7/3/16.

import Foundation
import ReactiveCocoa
import enum Result.NoError


public func SPBox<T>(_ value: T) -> SignalProducer<T, Result.NoError> {
  return SignalProducer(value: value)
}

public func rectSignal<E>(
  rect: SignalProducer<CGRect, E>? = nil,
  size: SignalProducer<CGSize, E>? = nil,
  origin: SignalProducer<CGPoint, E>? = nil,
  center: SignalProducer<CGPoint, E>? = nil,
  centerX: SignalProducer<CGFloat, E>? = nil,
  centerY: SignalProducer<CGFloat, E>? = nil,
  width: SignalProducer<CGFloat, E>? = nil,
  height: SignalProducer<CGFloat, E>? = nil,
  left: SignalProducer<CGFloat, E>? = nil,
  right: SignalProducer<CGFloat, E>? = nil,
  top: SignalProducer<CGFloat, E>? = nil,
  bottom: SignalProducer<CGFloat, E>? = nil
) -> SignalProducer<CGRect, E> {
  var signal = SignalProducer<CGRect, E>(value: CGRectZero)

  assert(left == nil || right == nil)
  assert(top == nil || bottom == nil)

  signal = rect == nil ? signal : rect!
  signal = size == nil ? signal : signal.replaceSize(size!)
  signal = origin == nil ? signal : signal.replaceOrigin(origin!)
  signal = width == nil ? signal : signal.replaceWidth(width!)
  signal = height == nil ? signal : signal.replaceHeight(height!)
  signal = center == nil ? signal : signal.replaceCenter(center!)
  signal = centerX == nil ? signal : signal.replaceCenterX(centerX!)
  signal = centerY == nil ? signal : signal.replaceCenterY(centerY!)
  signal = left == nil ? signal : signal.replaceX(left!)
  signal = right == nil ? signal : signal.replaceRight(right!)
  signal = top == nil ? signal : signal.replaceY(top!)
  signal = bottom == nil ? signal : signal.replaceBottom(bottom!)

  return signal
}
