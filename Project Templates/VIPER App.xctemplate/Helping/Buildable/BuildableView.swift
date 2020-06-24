//___FILEHEADER___

import UIKit

class BuildableView: UIView {
  let doneButton = UIButton()
  lazy var toolBar: UIToolbar = {
    let toolBar = UIToolbar()
    let flex = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let done = UIBarButtonItem(customView: doneButton)
    toolBar.items = [flex, done]
    toolBar.sizeToFit()
    return toolBar
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addViews()
    configureViews()
    anchorViews()
  }
  
  @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
    fatalError("not implemented")
  }
  
  func addViews() { }
  
  func configureViews() {
    backgroundColor = .white
  }
  
  func anchorViews() { }
}
