//___FILEHEADER___

import Foundation

final class ___FILEBASENAMEASIDENTIFIER___: BaseBuilder {
  static func create() -> (presenter: ___VARIABLE_productName___Inputs, view: Modulable, router: BaseRouter) {
    let view = ___VARIABLE_productName___ViewController()
    let presenter = ___VARIABLE_productName___Presenter()
    let interactor = ___VARIABLE_productName___Interactor()
    let router = ___VARIABLE_productName___Router()

    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    interactor.presenter = presenter
    
    router.view = view

    return (presenter, view, router)
  }
}
