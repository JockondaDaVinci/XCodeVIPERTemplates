//___FILEHEADER___

import Foundation

enum UserInputType {
  case email(String?)
}


protocol UserInputValidationServiceProtocol {
  func validateEmail(_ email: String?) throws
}

enum ValidationServiceError: Error, Hashable {
  case invalidInput(UserInputType)
  case emptyInput(UserInputType)
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(String(describing: self))
  }
}

extension ValidationServiceError: Equatable {
  static func == (lhs: ValidationServiceError, rhs: ValidationServiceError) -> Bool {
    return lhs.hashValue == rhs.hashValue
  }
}

extension ValidationServiceError: LocalizedError {
  public var errorDescription: String? {
    switch self {
    case .invalidInput(let inputType):
      switch inputType {
      case .email:
        return "Invalid email"
      }
    default:
      return String(describing: self)
    }
  }
}

final class UserInputValidationService: UserInputValidationServiceProtocol {
  func validateEmail(_ email: String?) throws  {
    guard let email = email, !email.isEmpty else {
      throw ValidationServiceError.emptyInput(.email(nil))
    }
    
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    
    let isValidEmail = emailTest.evaluate(with: email)
    if !isValidEmail { throw ValidationServiceError.invalidInput(.email(email)) }
  }
}


