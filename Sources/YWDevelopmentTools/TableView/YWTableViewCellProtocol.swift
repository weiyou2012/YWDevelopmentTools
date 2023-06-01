import UIKit

public protocol YWClassTableViewCell: UITableViewCell, YWReusable {}

public protocol YWXibTableViewCell: YWClassTableViewCell, YWNibLoadable {}
