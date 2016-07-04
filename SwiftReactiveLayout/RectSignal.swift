//  Created by Joseph Constantakis on 7/3/16.

import Foundation
import ReactiveCocoa

public func rectSignal<E>(
  rect: Signal<CGRect, E>? = nil,
  size: Signal<CGSize, E>? = nil,
  origin: Signal<CGPoint, E>? = nil,
  center: Signal<CGPoint, E>? = nil,
  centerX: Signal<CGFloat, E>? = nil,
  centerY: Signal<CGFloat, E>? = nil,
  width: Signal<CGFloat, E>? = nil,
  height: Signal<CGFloat, E>? = nil,
  left: Signal<CGFloat, E>? = nil,
  right: Signal<CGFloat, E>? = nil,
  top: Signal<CGFloat, E>? = nil,
  bottom: Signal<CGFloat, E>? = nil
) -> Signal<CGRect, E> {
  var (signal, observer) = Signal<CGRect, E>.pipe()

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

  observer.sendNext(CGRectZero)
  return signal
}
