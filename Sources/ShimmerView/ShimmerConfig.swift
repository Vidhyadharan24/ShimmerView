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
    public let didChange = PassthroughSubject<ShimmerConfig, Never>()
    
    var bgColor: Color {
        didSet {
            didChange.send(self)
        }
    }
    
    var fgColor: Color {
        didSet {
            didChange.send(self)
        }
    }
    
    public init(bgColor: Color? = nil, fgColor: Color? = nil) {
        self.bgColor = bgColor ?? Color(white: 0.7843137255)
        self.fgColor = fgColor ?? .white
    }

}
