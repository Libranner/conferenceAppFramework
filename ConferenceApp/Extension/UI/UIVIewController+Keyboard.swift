import UIKit

extension UIViewController {
  @objc func hideKeyboard() {
    self.view.endEditing(true)
  }
}
