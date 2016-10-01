//  Created by Joseph Constantakis on 7/16/16.

public extension NSObject {
  func lazyProperty<T>(_ key: UnsafeRawPointer, _ initializer: (() -> T)) -> T {
    func getter() -> T? {
      return getAssociatedObject(self, key)
    }
    if getter() == nil {
      setAssociatedObject(self, key, initializer(), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    return getter()!
  }
}

private final class ValueWrapper<T> {
  let value: T
  init(_ x: T) {
    value = x
  }
}

private func wrap<T>(_ x: T) -> ValueWrapper<T>  {
  return ValueWrapper(x)
}

func setAssociatedObject<T>(_ object: AnyObject, _ associativeKey: UnsafeRawPointer, _ value: T,
    _ policy: objc_AssociationPolicy) {
  if let v: AnyObject = value as? AnyObject {
    objc_setAssociatedObject(object, associativeKey, v,  policy)
  }
  else {
    objc_setAssociatedObject(object, associativeKey, wrap(value),  policy)
  }
}

func getAssociatedObject<T>(_ object: AnyObject, _ associativeKey: UnsafeRawPointer) -> T? {
  if let v = objc_getAssociatedObject(object, associativeKey) as? T {
    return v
  }
  else if let v = objc_getAssociatedObject(object, associativeKey) as? ValueWrapper<T> {
    return v.value
  }
  else {
    return nil
  }
}

