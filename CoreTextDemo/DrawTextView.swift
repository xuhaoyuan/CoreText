//
//  DrawTextView.swift
//  CoreTextDemo
//
//  Created by YUAN on 2017/8/3.
//  Copyright © 2017年 YUAN. All rights reserved.
//

import UIKit
import CoreText

class DrawTextView: UIView {
    
    
    var size: CGSize = .zero
    var attributes: [String: Any] = [:]
    var attributedString: NSAttributedString?
    var maxHeight: CGFloat = 0
    let backgroundView = UIView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func draw(attributedText: NSAttributedString) {
        attributedString = attributedText
        self.setNeedsDisplay()
    }
    
    
    override func draw(_ rect: CGRect) {
        guard let attributedString = attributedString,
            let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.textMatrix = CGAffineTransform.identity
        context.translateBy(x:0, y: self.frame.size.height)
        context.scaleBy(x: 1.0, y: -1.0)

        let path = CGMutablePath()
        let rect = bounds
        
        path.addRect(rect)
        
        let frameSetter = CTFramesetterCreateWithAttributedString(attributedString as CFAttributedString)
        
        let ctFrame = CTFramesetterCreateFrame(frameSetter, CFRange(location: 0, length: attributedString.length), path, nil)
        
//            let lines = CTFrameGetLines(ctFrame) as! Array<CTLine>
        
//        CTRunDelegateCallbacks(version: kCTRunDelegateVersion1, dealloc: { (refCon) in
//            
//        }, getAscent: { (refCon) -> CGFloat in
//            
//        }, getDescent: { (refCon) -> CGFloat in
//            
//        }, getWidth: { (refCon) -> CGFloat in
//            
//        });
        
        CTFrameDraw(ctFrame, context)
        
    }
    
}
