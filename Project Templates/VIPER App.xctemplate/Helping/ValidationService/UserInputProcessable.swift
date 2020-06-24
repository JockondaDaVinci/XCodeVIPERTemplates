//___FILEHEADER___

import Foundation

protocol UserInputProcessable: AnyObject {
  func onInteractorInputIsValid(inputType: UserInputType)
  func onInteractorAllInputsAreValid()
  func onInteractorInputIsInvalid(_ error: Error)
}
