import UIKit

public class YWSemicircularView: UIView {
    
    public private(set) var progress: CGFloat = 0
    
    private var bgLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    private var startPoint: CGFloat = .pi
    private var endPoint: CGFloat = .pi * 0
    private var progressLineWidth: CGFloat = 11.0
    
    public var animationDuration: Double = 0.8
    public var progressBgColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
    public var progressColor = UIColor.white
    
    public init(progresss: CGFloat, animationDuration: Double, progressBgColor: UIColor, progressColor: UIColor) {
        self.progress = progresss
        self.animationDuration = animationDuration
        self.progressBgColor = progressBgColor.cgColor
        self.progressColor = progressColor
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        addPorgressAnulus()
    }
    
    private func addPorgressAnulus() {
        let center = CGPoint(x: bounds.midX, y: bounds.maxY)
        let radius = bounds.height - progressLineWidth / 2
        let bPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: .pi, endAngle: 0, clockwise: true)
        bgLayer.path = bPath.cgPath
        bgLayer.lineWidth = 11.0
        bgLayer.fillColor = UIColor.clear.cgColor
        bgLayer.strokeColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5).cgColor
        layer.addSublayer(bgLayer)
        
        progressLayer.path = bPath.cgPath
        progressLayer.lineWidth = 11.0
        progressLayer.lineCap = .round
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeEnd = progress
        progressLayer.strokeColor = UIColor.white.cgColor
        addAnimation(to: progressLayer)
        layer.addSublayer(progressLayer)
    }
    
    private func addAnimation(to layer: CAShapeLayer) {
        let caAnimation = CABasicAnimation(keyPath: "strokeEnd")
        caAnimation.duration = animationDuration
        caAnimation.fromValue = 0
        caAnimation.toValue = progress
        layer.add(caAnimation, forKey: "progressAnimation")
    }
    
    public func setProgress(_ num: Float, animation: Bool) {
        guard (0...1).contains(progress) else { return }
        progress = CGFloat(num)
        progressLayer.strokeEnd = CGFloat(progress)
        if animation {
            addAnimation(to: progressLayer)
        }
    }
}




