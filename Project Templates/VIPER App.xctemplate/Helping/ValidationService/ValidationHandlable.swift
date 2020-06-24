//___FILEHEADER___

import UIKit

protocol ValidationHandlable {
  func showInputErrorMessage(inputType: UserInputType, message: String)
  func hideInputErrorMessage(inputType: UserInputType)
  func toggleButton(isEnabled: Bool)
}
