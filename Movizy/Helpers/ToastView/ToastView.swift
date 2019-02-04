import UIKit

public enum ToastPosition {
    case top
    case center
    case bottom
}

enum ToastType {
    case error
    case success
}

class ToastView: UIView {
    
    private lazy var appWindow: UIWindow? = UIApplication.shared.keyWindow
    private var toastQueue = [ToastView]()
    private var needToInsertIntoQueue = false
    
    var fadeDuration = 1.0
    var delayDuration = 4.0
    var verticalPadding: CGFloat = 20.0
    var position: ToastPosition = .top
    var needsToHideStatusBar = false
    
    @IBOutlet private weak var toastTitle: UILabel!
    @IBOutlet private weak var messageTypeIcon: UIImageView!
    
    class func instance(with formView: UIView) -> ToastView {
        
        let frame = CGRect(x: 0,
                           y: 0 ,
                           width: UIScreen.width,
                           height: getViewHeight())
        
        let view = Init(ToastView(frame: frame)) {
            $0.position = .top
            $0.verticalPadding = 0
            $0.fadeDuration = 0.5
            $0.needsToHideStatusBar = true
            $0.addOnClickListener()
        }
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        _ = Init(instanceFromNib()) {
            $0.frame = bounds
            $0.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
            addSubview($0)
        }
    }
    
    func instanceFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = String(describing: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view: UIView = cast(nib.instantiate(withOwner: self, options: nil)[0])
        return view
    }
}

extension ToastView {
    
    func updateData(_ title: String, type: ToastType) {
        toastTitle.text = title
        setMessageTypeIcon(type)
    }
    
    private func setMessageTypeIcon(_ messageType: ToastType) {
        switch  messageType {
        case .error:
            messageTypeIcon.image = ImageResource.error.image
        default:
            messageTypeIcon.image = ImageResource.success.image
        }
    }
    
    func showToast() {
        if needToInsertIntoQueue {
            toastQueue.append(self)
            return
        }
        
        needToInsertIntoQueue = true
        self.center = centerPoint()
        self.alpha = 0.0
        if needsToHideStatusBar {
            appWindow?.windowLevel = UIWindow.Level.statusBar + 1
        }
        appWindow?.addSubview(self)
        
        animate { self.alpha = 1.0 }
            .duration(TimeInterval(fadeDuration))
            .delay(0.0)
            .options([.curveEaseIn, .beginFromCurrentState])
            .completion { [weak self] _ in
                guard let strongSelf = self else { return }
                let timer = Timer(timeInterval: TimeInterval(strongSelf.delayDuration),
                                  target: strongSelf,
                                  selector: #selector(strongSelf.toastTimerDidFinish),
                                  userInfo: nil,
                                  repeats: false)
                RunLoop.main.add(timer, forMode: RunLoop.Mode.common)
            }
            .async()
    }
    
    @objc func toastTimerDidFinish() {
        hideToast(TimeInterval(fadeDuration))
    }
    
    func hideToastImmediately() {
        hideToast(TimeInterval(0.300))
    }
    
    func hideToast(_ intervalTime: TimeInterval) {
        animate { self.alpha = 0 }
            .duration(intervalTime)
            .delay(0.0)
            .options([.curveEaseIn, .beginFromCurrentState])
            .completion { [weak self] _ in
                guard let strongSelf = self else { return }
                strongSelf.needToInsertIntoQueue = false
                strongSelf.removeFromSuperview()
                strongSelf.toastQueue.popLast()?.showToast()
                if strongSelf.needsToHideStatusBar {
                    strongSelf.appWindow?.windowLevel = UIWindow.Level.normal
                }
            }
            .async()
    }
    
    func centerPoint() -> CGPoint {
        switch position {
        case .top:
            let yValue: CGFloat = 20 + (UIDevice.isIphoneX ? 20 : 0)
            return CGPoint(x: UIScreen.width / 2.0, y: yValue)
            
        case .center:
            return CGPoint(x: UIScreen.width / 2.0, y: UIScreen.height / 2.0)
            
        case .bottom:
            let parenntHeight = UIScreen.height
            return CGPoint(x: UIScreen.width / 2.0, y: ( parenntHeight - (self.frame.size.height ) - verticalPadding) )
        }
    }
    
    class func getViewHeight() -> CGFloat {
        return 40 + (UIDevice.isIphoneX ? 60 : 0)
    }
    
    private func addOnClickListener() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickView))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func onClickView() {
        hideToastImmediately()
    }
}
