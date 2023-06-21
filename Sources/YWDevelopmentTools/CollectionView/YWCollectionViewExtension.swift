import UIKit

public extension UICollectionView {

    func register<T: YWXibCollectionViewCell>(_: T.Type) where T: YWNibLoadable {
        register(T.nib, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: YWXibCollectionViewCell>(for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
        guard let cell = cell else {
            fatalError("The dequeueReusableCell \(String(describing: T.self)) couldn't be loaded.")
        }
        return cell
    }
    
    func register<T: YWClassCollectionViewCell>(_: T.Type) where T: YWReusable {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: YWClassCollectionViewCell>(for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T
        guard let cell = cell else {
            fatalError("The dequeueReusableCell \(String(describing: T.self)) couldn't be loaded.")
        }
        return cell
    }
}
