import UIKit

public protocol YWNibLoadable {
    static var nib: UINib { get }
}

public extension YWNibLoadable {
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: nil)
    }
}
