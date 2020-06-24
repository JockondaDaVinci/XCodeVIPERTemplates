//___FILEHEADER___

import UIKit

extension UIView {
  static var reuseId: String {
    return String(describing: self)
  }
}
