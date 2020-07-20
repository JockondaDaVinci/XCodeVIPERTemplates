//___FILEHEADER___

import Foundation
import UIKit

//MARK: - Define event from view
enum ___VARIABLE_productName___ViewEvent {
  
}

//MARK: - Define functions that will be implemented in ViewController
protocol ___VARIABLE_productName___PresenterToView: AnyObject {
  func setupInitialState()
}

//MARK: - Implementation of ViewController
final class ___FILEBASENAMEASIDENTIFIER___: BuildableViewController<___VARIABLE_productName___View> {
  var presenter: ___VARIABLE_productName___ViewToPresenter?

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.onViewLoaded()
  }
}

//MARK: - Implementation of defined funtions
extension ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_productName___PresenterToView {
  func setupInitialState() {
    setupUI()
    setupActions()
  }
}

//MARK: - Private extension with additional setup
private extension ___FILEBASENAMEASIDENTIFIER___ {
  func setupUI() {
    
  }
  
  func setupActions() {
    
  }
}

