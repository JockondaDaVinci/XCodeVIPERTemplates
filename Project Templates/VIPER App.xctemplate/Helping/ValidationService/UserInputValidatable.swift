//___FILEHEADER___

import Foundation

protocol UserInputValidatable: AnyObject {
  var inputProcesser: UserInputProcessable? {get}
  var validationService: UserInputValidationServiceProtocol! {get}
  
  func validateUserInput(inputTypes: [UserInputType])
}

extension UserInputValidatable {
  func validateUserInput(inputTypes: [UserInputType]) {
    do {
      for inputType in inputTypes {
        try validateInput(inputType)
        inputProcesser?.onInteractorInputIsValid(inputType: inputType)
      }
      inputProcesser?.onInteractorAllInputsAreValid()
    } catch {
      inputProcesser?.onInteractorInputIsInvalid(error)
    }
  }
  
  private func validateInput(_ inputType: UserInputType) throws {
    do {
      switch inputType {
      case .email(let email):
        try validationService.validateEmail(email)
      }
    } catch {
      throw error
    }
  }
}

