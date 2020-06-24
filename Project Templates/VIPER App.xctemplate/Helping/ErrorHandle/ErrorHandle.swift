//___FILEHEADER___

import UIKit

protocol ErrorHandle {
  var viewUnderline: UIView { get set }
  var errorLabel: UILabel { get set }
  var errorUnderlineColor: UIColor? { get set }
  var editingUnderlineColor: UIColor? { get set }
  var inactiveUnderlineColor: UIColor? { get set }
  
  func showValidationErrorMessage(_ error: String)
  func setValid()
}


//Extensions for you error handlable views e.g.
//extension TextField: ErrorHandle { }
//extension TextView: ErrorHandle { }

extension ErrorHandle {
  func showValidationErrorMessage(_ error: String) {
    errorLabel.text = error
    viewUnderline.backgroundColor = errorUnderlineColor
  }
  
  func setValid() {
    errorLabel.text = nil
    viewUnderline.backgroundColor = editingUnderlineColor
  }
}

