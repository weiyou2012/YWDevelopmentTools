import UIKit

public struct CollectionViewContainer {
    
    public let collectionView: UICollectionView
    public init(collectionView: UICollectionView) {
        self.collectionView = collectionView
    }
    
    public func register<T: YWXibCollectionViewCell>(_: T.Type) where T: YWNibLoadable {
        collectionView.register(T.nib, forCellWithReuseIdentifier: T.identifier)
    }
    
    public func dequeueReusableCell<T: YWXibCollectionViewCell>(for indexPath: IndexPath) -> T {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
        guard let cell = cell else {
            fatalError("The dequeueReusableCell \(String(describing: T.self)) couldn't be loaded.")
        }
        return cell
    }
    
    public func register<T: YWClassCollectionViewCell>(_: T.Type) where T: YWReusable {
        collectionView.register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    public func dequeueReusableCell<T: YWClassCollectionViewCell>(for indexPath: IndexPath) -> T {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
        guard let cell = cell else {
            fatalError("The dequeueReusableCell \(String(describing: T.self)) couldn't be loaded.")
        }
        return cell
    }
}


extension UICollectionView {
    /// 使用yw调用开发工具的方法。
    ///
    /// 例子
    /// ```
    /// let collectionView = UICollectionView()
    /// collection.yw.register()
    /// ...
    ///
    /// ```
    var yw: CollectionViewContainer {
        CollectionViewContainer(collectionView: self)
    }
}
