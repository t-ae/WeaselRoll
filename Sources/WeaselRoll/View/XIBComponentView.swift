#if os(iOS)

import UIKit

open class XIBComponentView: UIView {
    @IBOutlet public private(set) var contentView: UIView!

    @IBInspectable public var isPassingSelf: Bool = true
    
    public convenience init() {
        self.init(frame: .zero)
        frame = contentViewInitialFrame
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadContentView()
        didInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadContentView()
        didInit()
    }
    
    public var contentViewInitialFrame: CGRect = .zero
    
    private func loadContentView() {
        precondition(contentView == nil)
        
        var view = XIBComponentView._loadContentView(owner: self)
        
        if contentView != nil {
            view = contentView
            view.removeFromSuperview()
        }
        
        contentView = view
        contentViewInitialFrame = view.frame
        setContentView(contentView)
    }
    
    private static func _loadContentView(owner: UIView) -> UIView {
        let objs_ = owner.bundle.loadNibNamed("\(type(of: owner))", owner: owner, options: nil)
        let objs = objs_!
        let obj = objs[0]
        let view = obj as! UIView
        return view
    }
    
    open func didInit() {}
    
    public override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if isPassingSelf {
            return hitInsidePointPassingSelf(point, with: event)
        } else {
            return super.point(inside: point, with: event)
        }
    }
}

#endif
