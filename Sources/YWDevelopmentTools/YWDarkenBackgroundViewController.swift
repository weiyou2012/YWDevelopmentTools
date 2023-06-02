import UIKit

/// 继承这个类，获取一个变暗的背景，使用 UIViewController 的 present(_,animation:) 即可实现。
open class YWDarkenBackgroundViewController: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        self.transitioningDelegate = self
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

fileprivate class DarkenPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let containerView = transitionContext.containerView
        containerView.addSubview(toViewController.view)
        toViewController.view.alpha = 0
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toViewController.view.alpha = 1
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
    }
    
}

fileprivate class DarkenDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.view(forKey: .from) else {
            return
        }
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toView.alpha = 0
        }, completion: { finished in
            toView.removeFromSuperview()
            transitionContext.completeTransition(finished)
        })
    }
    
}

extension YWDarkenBackgroundViewController: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        DarkenPresentAnimationController()
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        DarkenDismissAnimationController()
    }
}
