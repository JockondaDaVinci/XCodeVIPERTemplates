//___FILEHEADER___

import Foundation

final class ___VARIABLE_rootClassName___Builder: BaseBuilder {
  static func create() -> (presenter: ___VARIABLE_rootClassName___Inputs, view: Modulable, router: BaseRouter) {
    let view = ___VARIABLE_rootClassName___ViewController()
    let presenter = ___VARIABLE_rootClassName___Presenter()
    let interactor = ___VARIABLE_rootClassName___Interactor()
    let router = ___VARIABLE_rootClassName___Router()

    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    interactor.presenter = presenter
    
    router.view = view

    return (presenter, view, router)
  }
}
