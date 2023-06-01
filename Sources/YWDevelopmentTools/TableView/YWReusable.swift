import Foundation

public protocol YWReusable: AnyObject {
    static var identifier: String { get }
}

public extension YWReusable {
    static var identifier: String { String(describing: self) }
}
