//___FILEHEADER___

import Foundation

protocol BaseBuilder {
  associatedtype PresenterType
  static func create() -> (presenter: PresenterType, view: Modulable, router: BaseRouter)
}
