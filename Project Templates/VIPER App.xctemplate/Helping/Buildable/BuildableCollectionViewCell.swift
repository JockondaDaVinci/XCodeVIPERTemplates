//___FILEHEADER___

import UIKit

class BuildableCollectionViewCell<View, Object>: UICollectionViewCell where View: UIView {
  var mainView: View
  
  override init(frame: CGRect) {
    self.mainView = View()
    super.init(frame: frame)
    contentView.addSubview(mainView)
    mainView.fillSuperview()
  }
  
  @available (*, unavailable) required init?(coder aDecoder: NSCoder) {
    fatalError("required init not implemented")
  }
  
  func config(with object: Object) { }
}
