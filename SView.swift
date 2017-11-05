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
    }
}
