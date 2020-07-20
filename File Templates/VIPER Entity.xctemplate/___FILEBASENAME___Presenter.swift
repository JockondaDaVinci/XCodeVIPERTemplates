//___FILEHEADER___

import Foundation

//MARK: - Translation of view events into presenter
protocol ___VARIABLE_productName___ViewToPresenter {
  func onViewLoaded()
  func onViewEvent(_ event: ___VARIABLE_productName___ViewEvent)
}

//MARK: - Translation of interactor events into presenter
protocol ___VARIABLE_productName___InteractorToPresenter {
  func onInteractorError(_ error: Error)
  func onInteractorSuccess()
}

//MARK: - Additional inputs into view
protocol ___VARIABLE_productName___Inputs {
  
}

//MARK: - Basic realization of presenter
final class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_productName___Inputs {
  weak var view: ___VARIABLE_productName___PresenterToView?
  var interactor: ___VARIABLE_productName___PresenterToInteractor?
  var router: ___VARIABLE_productName___Router.Routes?
  
  //Module inputs
}

//MARK: - Operations with view
extension ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_productName___ViewToPresenter {
  //MARK: Any additional setups e.g. launching network requests
  func onViewLoaded() {
    view?.setupInitialState()
  }
  
  //MARK: - Oparations with view events
  func onViewEvent(_ event: ___VARIABLE_productName___ViewEvent) {
    switch event {
    default: break
    }
  }
}

//MARK: - Operations with interactor
extension ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_productName___InteractorToPresenter {
  //MARK: Error handling
  func onInteractorError(_ error: Error) {
    debugPrint(error)
  }
  
  //MARK: Operating with data
  func onInteractorSuccess() {
    
  }
}
