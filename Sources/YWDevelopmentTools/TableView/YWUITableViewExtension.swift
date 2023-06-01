import UIKit

public extension UITableView {
    
    /// 使用yw调用开发工具的方法。
    ///
    /// 例子
    /// ```
    /// let tableView = UITableView()
    /// tableView.yw.register()
    /// ...
    /// ```
    var yw: TableViewContainer {
        TableViewContainer(con: self)
    }
}

public struct TableViewContainer {
    
    public var con: UITableView
    public init(con: UITableView) {
        self.con = con
    }
    
    /// 注册，xib 创建的table view cell
    ///
    /// 用法：创建cell 的 xib文件[HomeOptionCardTableViewCell.xib]，设置对应的类，和identifier[类名]。
    ///
    /// 例子：
    /// ```
    /// class HomeOptionCardTableViewCell: YWBaseTableViewCell {}
    /// tableView.register(HomeOptionCardTableViewCell.self)
    /// ```
    public func register<T: YWXibTableViewCell>(_: T.Type) where T: YWNibLoadable {
        con.register(T.nib, forCellReuseIdentifier: T.identifier)
    }

    /// 获取复用cell
    /// - Parameter indexPath: 复用cell的索引
    /// - Returns: 具体的cell
    ///
    /// 用法：创建cell 的 xib文件[HomeOptionCardTableViewCell.xib]，设置对应的类，和identifier[类名]。
    ///
    /// ```
    ///    class HomeOptionCardTableViewCell: YWBaseTableViewCell {}
    ///
    ///    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    ///        let cell: HomeOptionCardTableViewCell = tableView.dequeueReusableCell(for: indexPath)
    ///        return cell
    ///    }
    /// ```
    public func dequeueReusableCell<T: YWXibTableViewCell>(for indexPath: IndexPath) -> T {
        let cell = con.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
        guard let cell = cell else {
            fatalError("The dequeueReusableCell \(String(describing: T.self)) couldn't be loaded.")
        }
        return cell
    }
    
    /// 注册，代码创建的 UITableViewCell
    public func register<T: YWClassTableViewCell>(cellClass: T.Type) {
        con.register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    /// 复用，代码创建的 UITableViewCell
    public func dequeueReusableCell<T: YWClassTableViewCell>(for indexPath: IndexPath) -> T {
        let cell = con.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
        guard let cell = cell else {
            fatalError("The dequeueReusableCell \(String(describing: T.self)) couldn't be loaded.")
        }
        return cell
    }
    
    /// 获取某个index 的 cell，适用于代码
    public func cellForRow<T: UITableViewCell>(at: IndexPath) -> T {
        let cell = con.cellForRow(at: at) as? T
        guard let cell = cell else {
            fatalError("The dequeueReusableCell \(String(describing: T.self)) couldn't be loaded.")
        }
        return cell
    }
    
}


