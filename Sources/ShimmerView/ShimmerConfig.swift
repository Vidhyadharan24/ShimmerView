//
//  ShimmerConfig.swift
//  ShimmerView
//
//  Created by Vidhyadharan Mohanram on 03/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

public class ShimmerConfig: ObservableObject {
    
    public let willChange = PassthroughSubject<ShimmerConfig, Never>()
    
    @Published var bgColor: Color
    
    @Published var fgColor: Color
    
    public init(bgColor: Color? = nil, fgColor: Color? = nil) {
        self.bgColor = bgColor ?? Color(white: 0.7843137255)
        self.fgColor = fgColor ?? .white
    }

}
