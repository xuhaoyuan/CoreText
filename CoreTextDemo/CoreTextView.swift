//
//  CoreTextView.swift
//  CoreTextDemo
//
//  Created by YUAN on 2017/8/7.
//  Copyright © 2017年 YUAN. All rights reserved.
//

import UIKit


class CoreTextView: UIScrollView {
    
    var textContainerInset: UIEdgeInsets = .zero {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    var defaultAttributes: [String: Any] = [NSFontAttributeName: UIFont.systemFont(ofSize: 20)]
    
    private let maxHeight: CGFloat = 10000
    
    fileprivate var drawString: String
    
    fileprivate var size: CGSize = CGSize.zero
    
    fileprivate var attriburedString: NSAttributedString
    
    fileprivate let backgroundView = UIView()
    
    
    fileprivate lazy var contentView: DrawTextView = {
        let view = DrawTextView()
        view.backgroundColor = UIColor.white
        view.frame = CGRect(x: 0, y: 0, width: self.contentSize.width, height: 0)
        return view
    }()
    
    public init(frame: CGRect, text: String, attributes: [String: Any]) {
        self.drawString = text
        self.attriburedString = attributes.isEmpty ? NSAttributedString(string: drawString, attributes: defaultAttributes) : NSAttributedString(string: drawString, attributes: attributes)
        super.init(frame: frame)
        
        self.addSubview(contentView)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func layoutContentView(){
        let size = layoutTextSize(attriburedText: attriburedString)
        
        contentSize = CGSize(width: frame.size.width,
                             height: size.height + textContainerInset.top + textContainerInset.bottom)
        
        contentView.frame = CGRect(x:textContainerInset.left,
                                   y:textContainerInset.top,
                                   width: size.width,
                                   height: size.height)
        
        contentView.draw(attributedText: attriburedString)
    }
    
    override func didMoveToSuperview() {
        layoutContentView()
    }
    
    func layoutTextSize(attriburedText: NSAttributedString) -> CGSize {
        
        let rect = CGRect(x: 0,
                          y: 0,
                          width: frame.width - textContainerInset.left - textContainerInset.right,
                          height: maxHeight)
        
        let path = CGMutablePath()
        path.addRect(rect)
        
        let ctFrameSetter = CTFramesetterCreateWithAttributedString(attriburedText as CFAttributedString)
        let ctFrame = CTFramesetterCreateFrame(ctFrameSetter, CFRange(location: 0, length: attriburedText.length), path, nil)
        
        guard let lines = CTFrameGetLines(ctFrame) as? [CTLine],
            let lastLine = lines.last else {
                return .zero
        }
        
        var lineOrigins: [CGPoint] = Array<CGPoint>(repeatElement(.zero, count: lines.count))
        let range: CFRange = CFRange(location: 0, length: 0)
        CTFrameGetLineOrigins(ctFrame, range, &lineOrigins)
        
        guard let lastLineOrigin = lineOrigins.last else {
            return .zero
        }
        
       
        
        let (leading, ascent, descent) = getTypographicBounds(line: lastLine)
        let lastLineHeight = leading + ascent + descent
        
        let height = ceil(maxHeight - lastLineOrigin.y + lastLineHeight)
        
        return CGSize(width: rect.width, height: height)
        
    }
    
    func getTypographicBounds(line: CTLine) -> (CGFloat, CGFloat, CGFloat) {
        var ascent: CGFloat = 0
        var descent: CGFloat = 0
        var leading: CGFloat = 0
        
        CTLineGetTypographicBounds(line, &ascent, &descent, &leading)
        return (ascent, descent, leading)
    }
    
}
