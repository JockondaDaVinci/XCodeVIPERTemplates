//___FILEHEADER___

import UIKit

enum AlertStyle {
  case success(String)
  case error(String)
}

protocol AlertPresentable {
  func showAlert(with style: AlertStyle)
}

extension AlertPresentable where Self: UIViewController { }

extension UIViewController: AlertPresentable {
  func showAlert(with style: AlertStyle) {
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
    var title = ""
    var message = ""
    switch style {
    case .success(let success):
      title = "Success"
      message = success
    case .error(let error):
      message = error
    }
    
    alert.title = title
    alert.message = message
    present(alert, animated: true, completion: nil)
  }
}
