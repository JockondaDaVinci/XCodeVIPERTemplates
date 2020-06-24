//___FILEHEADER___

import Foundation

final class ___FILEBASENAMEASIDENTIFIER___Builder: BaseBuilder {
  static func create() -> (presenter: ___FILEBASENAMEASIDENTIFIER___Inputs, view: Modulable, router: BaseRouter) {
    let view = ___FILEBASENAMEASIDENTIFIER___ViewController()
    let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter()
    let interactor = ___FILEBASENAMEASIDENTIFIER___Interactor()
    let router = ___FILEBASENAMEASIDENTIFIER___Router()

    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    interactor.presenter = presenter
    
    router.view = view

    return (presenter, view, router)
  }
}
