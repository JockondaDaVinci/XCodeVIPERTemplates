//___FILEHEADER___

import Foundation
import UIKit

//MARK: - Define event from view
enum ___FILEBASENAMEASIDENTIFIER___ViewEvent {
  
}

//MARK: - Define functions that will be implemented in ViewController
protocol ___FILEBASENAMEASIDENTIFIER___PresenterToView: AnyObject {
  func setupInitialState()
}

//MARK: - Implementation of ViewController
final class ___FILEBASENAMEASIDENTIFIER___ViewController: BuildableViewController<___FILEBASENAMEASIDENTIFIER___View> {
  var presenter: ___FILEBASENAMEASIDENTIFIER___ViewToPresenter?

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.onViewLoaded()
  }
}

//MARK: - Implementation of defined funtions
extension ___FILEBASENAMEASIDENTIFIER___ViewController: ___FILEBASENAMEASIDENTIFIER___PresenterToView {
  func setupInitialState() {
    setupUI()
    setupActions()
  }
}

//MARK: - Private extension with additional setup
private extension ___FILEBASENAMEASIDENTIFIER___ViewController {
  func setupUI() {
    
  }
  
  func setupActions() {
    
  }
}

