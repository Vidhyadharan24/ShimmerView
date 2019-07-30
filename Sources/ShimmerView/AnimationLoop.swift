//
//  AnimationLoop.swift
//  ShimmerView
//
//  Created by Vidhyadharan Mohanram on 01/07/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI
import Combine

class AnimationLoop: ObservableObject {
    let willChange = PassthroughSubject<AnimationLoop, Never>()

    private var timer: Timer?
    
    @Published public var isActive: Bool = false {
        willSet {
            willChange.send(self)
        }
    }
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.isActive = false
            
            withAnimation { self.isActive = true }
        }
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
}
