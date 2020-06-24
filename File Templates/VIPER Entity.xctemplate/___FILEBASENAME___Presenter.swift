//___FILEHEADER___

import Foundation

//MARK: - Translation of view events into presenter
protocol ___FILEBASENAMEASIDENTIFIER___ViewToPresenter {
  func onViewLoaded()
  func onViewEvent(_ event: ___FILEBASENAMEASIDENTIFIER___ViewEvent)
}

//MARK: - Translation of interactor events into presenter
protocol ___FILEBASENAMEASIDENTIFIER___InteractorToPresenter {
  func onInteractorError(_ error: Error)
  func onInteractorSuccess()
}

//MARK: - Additional inputs into view
protocol ___FILEBASENAMEASIDENTIFIER___Inputs {
  
}

//MARK: - Basic realization of presenter
final class ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___Inputs {
  weak var view: ___FILEBASENAMEASIDENTIFIER___PresenterToView?
  var interactor: ___FILEBASENAMEASIDENTIFIER___PresenterToInteractor?
  var router: ___FILEBASENAMEASIDENTIFIER___Router.Routes?
  
  //Module inputs
}

//MARK: - Operations with view
extension ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___ViewToPresenter {
  //MARK: Any additional setups e.g. launching network requests
  func onViewLoaded() {
    view?.setupInitialState()
  }
  
  //MARK: - Oparations with view events
  func onViewEvent(_ event: ___FILEBASENAMEASIDENTIFIER___ViewEvent) {
    switch event {
    default: break
    }
  }
}

//MARK: - Operations with interactor
extension ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___InteractorToPresenter {
  //MARK: Error handling
  func onInteractorError(_ error: Error) {
    debugPrint(error)
  }
  
  //MARK: Operating with data
  func onInteractorSuccess() {
    
  }
}
