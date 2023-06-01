import UIKit

public protocol XibViewProtocol: UIView {}
public extension XibViewProtocol {
    static func xibInit() -> Self {
        let desc = String(describing: Self.self)
        let view = Bundle.main.loadNibNamed(desc, owner: nil)?.last as! Self
        return view
    }
}

public protocol ShowInWindow: UIView {}
public extension ShowInWindow where Self: XibViewProtocol {
    /// xib创建的view，在 window中弹窗
    @discardableResult static func xibShowInWindow() -> Self {
        let view = xibInit()
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.last!
        view.frame = window.bounds
        window.addSubview(view)
        return view
    }
}

public extension ShowInWindow {
    /// 代码创建view，在 window中弹窗
    func showInWindow() {
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.last!
        frame = window.bounds
        window.addSubview(self)
    }
}

