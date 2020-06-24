//___FILEHEADER___

import UIKit

protocol BaseRouterProtocol {
  var view: Modulable? { get set }
  func open(_ viewController: UIViewController?, completion: VoidClosure?, embeded: Bool)
  func close(completion: VoidClosure?)
  func navigationBuilded(for viewController: UIViewController, title: String) -> UIViewController
}

extension BaseRouterProtocol {
  var viewController: UIViewController? {
    return view?.viewController
  }
  
  func open(_ viewController: UIViewController?, completion: VoidClosure?, embeded: Bool = false) {
    guard let viewController = viewController else {
      fatalError("ViewController does not exist")
    }
    
    if self.viewController?.navigationController != nil && !embeded {
      self.viewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
      self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    } else {
      self.viewController?.present(viewController, animated: true, completion: completion)
    }
  }
  
  func close(completion: VoidClosure?) {
    guard let viewController = viewController else {
      fatalError("ViewController does not exist")
    }
    
    if let nav = viewController.navigationController {
      nav.popViewController(animated: true)
    } else {
      viewController.dismiss(animated: true, completion: completion)
    }
  }
  
  func navigationBuilded(for viewController: UIViewController, title: String) -> UIViewController {
    let nav = UINavigationController(rootViewController: viewController)
    
    //Any additional setup for navigationBar
    nav.navigationBar.barTintColor = .black
    nav.navigationBar.tintColor = .white
    nav.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    viewController.title = title
    return nav
  }
}

class BaseRouter: BaseRouterProtocol {
  var view: Modulable?
}
