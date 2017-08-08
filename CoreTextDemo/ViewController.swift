//
//  ViewController.swift
//  CoreTextDemo
//
//  Created by YUAN on 2017/8/3.
//  Copyright © 2017年 YUAN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    let descText: String = "春盼望着，盼望着，东风来了，春天的脚步近了。一切都像刚睡醒的样子，欣欣然张开了眼。山朗润起来了，水涨起来了，太阳的脸红起来了。小草偷偷地从土里钻出来，嫩嫩的，绿绿的。园子里，田野里，瞧去，一大片一大片满是的。坐着，躺着，打两个滚，踢几脚球，赛几趟跑，捉几回迷藏。风轻悄悄的,草软绵绵的。桃树、杏树、梨树，你不让我，我不让你，都开满了花赶趟儿。红的像火，粉的像霞，白的像雪。花里带着甜味儿；闭了眼，树上仿佛已经满是桃儿、杏儿、梨儿。花下成千成百的蜜蜂嗡嗡地闹着，大小的蝴蝶飞来飞去。野花遍地是：杂样儿，有名字的，没名字的，散在草丛里，像眼睛，像星星，还眨呀眨的。“吹面不寒杨柳风”，不错的，像母亲的手抚摸着你。风里带来些新翻的泥土的气息，混着青草味儿，还有各种花的香，都在微微润湿的空气里酝酿。鸟儿将巢安在繁花嫩叶当中，高兴起来了，呼朋引伴地卖弄清脆的喉咙，唱出宛转的曲子，跟轻风流水应和着。牛背上牧童的短笛，这时候也成天嘹亮地响着。雨是最寻常的，一下就是三两天。可别恼，看，像牛毛，像花针，像细丝，密密地斜织着，人家屋顶上全笼着一层薄烟。树叶儿却绿得发亮，小草儿也青得逼你的眼。傍晚时候，上灯了，一点点黄晕的光，烘托出一片安静而和平的夜。在乡下，小路上，石桥边，有撑起伞慢慢走着的人，地里还有工作的农民，披着蓑戴着笠。他们的房屋，稀稀疏疏的，在雨里静默着。天上风筝渐渐多了，地上孩子也多了。城里乡下，家家户户，老老小小，也赶趟儿似的，一个个都出来了。舒活舒活筋骨，抖擞抖擞精神，各做各的一份事去。“一年之计在于春”，刚起头儿，有的是工夫，有的是希望。春天像刚落地的娃娃，从头到脚都是新的，它生长着。春天像小姑娘，花枝招展的，笑着，走着。春天像健壮的青年，有铁一般的胳膊和腰脚，领着我们上前去。附加些：朱自清，现代著名散文家、诗人、学者、民主战士。其散文以 朴素缜密，清隽沉郁、语言洗炼，文笔清丽著称，极富有真情实感。代表作《荷塘月色》、《背影》、《桨声灯影里的秦淮河》等"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    public func setupSubView (){
        
        var attributes: [String: Any] = [:]
        
        let paragraph: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraph.lineSpacing = 2
        
        attributes[NSFontAttributeName] = UIFont.systemFont(ofSize: 20)
        attributes[NSParagraphStyleAttributeName] = paragraph
        
        let drawTextView = CoreTextView(frame: view.frame, text: descText, attributes: attributes)
        drawTextView.textContainerInset = UIEdgeInsetsMake(50, 10, 50, 10)
        view.addSubview(drawTextView)
        drawTextView.translatesAutoresizingMaskIntoConstraints = false
        drawTextView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        drawTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        drawTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        drawTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
