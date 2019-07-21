//
//  ShimmerConfig.swift
//  ShimmerView
//
//  Created by Vidhyadharan Mohanram on 03/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

public class ShimmerConfig: BindableObject {
    
    public let willChange = PassthroughSubject<ShimmerConfig, Never>()
    
    var bgColor: Color {
        willSet {
            willChange.send(self)
        }
    }
    
    var fgColor: Color {
        willSet {
            willChange.send(self)
        }
    }
    
    public init(bgColor: Color? = nil, fgColor: Color? = nil) {
        self.bgColor = bgColor ?? Color(white: 0.7843137255)
        self.fgColor = fgColor ?? .white
    }

}
