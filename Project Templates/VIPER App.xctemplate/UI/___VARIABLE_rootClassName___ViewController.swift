//___FILEHEADER___

import Foundation
import UIKit

//MARK: - Define event from view
enum ___VARIABLE_rootClassName___ViewEvent {
  
}

//MARK: - Define functions that will be implemented in ViewController
protocol ___VARIABLE_rootClassName___PresenterToView: AnyObject {
  func setupInitialState()
}

//MARK: - Implementation of ViewController
final class ___VARIABLE_rootClassName___ViewController: BuildableViewController<___VARIABLE_rootClassName___View> {
  var presenter: ___VARIABLE_rootClassName___ViewToPresenter?

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.onViewLoaded()
  }
}

//MARK: - Implementation of defined funtions
extension ___VARIABLE_rootClassName___ViewController: ___VARIABLE_rootClassName___PresenterToView {
  func setupInitialState() {
    setupUI()
    setupActions()
  }
}

//MARK: - Private extension with additional setup
private extension ___VARIABLE_rootClassName___ViewController {
  func setupUI() {
    
  }
  
  func setupActions() {
    
  }
}

