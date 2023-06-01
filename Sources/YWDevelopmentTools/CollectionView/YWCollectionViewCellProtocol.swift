import UIKit

public protocol YWClassCollectionViewCell: UICollectionViewCell, YWReusable {}

public protocol YWXibCollectionViewCell: YWClassCollectionViewCell, YWNibLoadable {}

