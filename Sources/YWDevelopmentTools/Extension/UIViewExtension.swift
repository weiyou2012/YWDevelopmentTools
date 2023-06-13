import UIKit

public extension UIView {
    /// 设置圆角
    func makeRoundCorner(cornerRadius: CGFloat, mask: Bool = true) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = mask
    }
    
    enum RoundCornerPart {
        case upLeft
        case upRight
        case downLeft
        case downRight
        
        var viewLayerMask: CACornerMask {
            switch self {
            case .upLeft:
                return .layerMinXMinYCorner
            case .downLeft:
                return .layerMinXMaxYCorner
            case .upRight:
                return .layerMaxXMinYCorner
            case .downRight:
                return .layerMaxXMaxYCorner
            }
        }
    }
    
    /// 设置部分圆角
    /// - Parameters:
    ///   - parts: 圆角的位置，如果设置为空数组，则不设置圆角
    ///   - cornerRadius: 圆角半径
    func makeRoundCorner(cornerRadius: CGFloat, parts: [RoundCornerPart]) {
        guard !parts.isEmpty else {
            return
        }
        
        let corners = parts.map { $0.viewLayerMask }
        layer.maskedCorners = CACornerMask(corners)
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    /// 设置边框
    func makeBorder(color: UIColor, width: CGFloat = 1.0) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    /// 设置阴影
    func makeShadow(color: UIColor = .gray, opacity: Float = 0.2, offset: CGSize = CGSize(width: 0, height: 0), radius: CGFloat) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }
    
    /// 虚线边框
    /// width:  虚线的宽度
    /// length：虚线的长度
    /// space：虚线间的间距
    /// cornerRadius：view圆角
    /// color：虚线的颜色
    func makeBorderDottedLine(width: CGFloat, length: CGFloat, space: CGFloat, color: UIColor) {
        layoutIfNeeded()
        let borderLayer = CAShapeLayer()
        borderLayer.bounds = bounds
        borderLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
        borderLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: layer.cornerRadius).cgPath
        borderLayer.lineWidth = width
        borderLayer.lineDashPattern = [length, space] as [NSNumber]?
        borderLayer.lineDashPhase = 0.1
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = color.cgColor
        self.layer.addSublayer(borderLayer)
    }
    
    /// 绘制虚线
    /// - Parameters:
    ///   - lineView: 添加虚线的view
    ///   - strokeColor: 虚线颜色
    ///   - lineWidth: 虚线宽度
    ///   - lineLength: 每段虚线的长度
    ///   - lineSpacing: 每段虚线的间隔
    func drawDashLine(strokeColor: UIColor, lineWidth: CGFloat, lineLength: Int, lineSpacing: Int) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = lineWidth
        //每一段虚线长度 和 每两段虚线之间的间隔
        shapeLayer.lineDashPattern = [NSNumber(value: lineLength), NSNumber(value: lineSpacing)]
        let path = CGMutablePath()
        path.addLines(between: [CGPoint.zero, CGPoint(x: bounds.midX, y: bounds.maxY)])
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
}
