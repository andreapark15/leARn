//
//  SVGView.swift
//  leARn
//
//  Created by Andrea Park on 2017-11-05.
//  Copyright © 2017 Andrea Park. All rights reserved.
//

import UIKit
import Macaw

class SView: MacawView {
    required init?(coder aDecoder: NSCoder) {
        let svg = try! SVGParser.parse(path: "svgs/easy/easy0-nine")
        svg.place = .scale(sx: 0.33, sy: 0.35)
        super.init(node: svg, coder: aDecoder)
        //! SVGParser.parse(path: "svgs/easy/easy0-nine"), coder: aDecoder)
//        svg.contentsVar.animate()
    }
    
//    required override init?(node: Node = Group(), coder aDecoder: NSCoder) {
//        let svg = try! SVGParser.parse(path: "svgs/easy/easy0-nine")
//        svg.place = .scale(sx: 0.33, sy: 0.35)
//
//        let zero = svg.clipVar(
//        let one = svg.nodeBy(tag: "make-me-a-hanzi-animation-1")!
//        let svgGroup = [zero].group()
        
//        svgGroup.contentsVar.animation(to: [one], during: 3.0).autoreversed().cycle().play()
//        super.init(node: rootNode, coder: aDecoder)
        //! SVGParser.parse(path: "svgs/easy/easy0-nine"), coder: aDecoder)
    
}
