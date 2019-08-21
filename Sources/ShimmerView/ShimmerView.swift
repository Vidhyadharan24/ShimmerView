//
//  ShimmerView.swift
//  ShimmerView
//
//  Created by Vidhyadharan Mohanram on 24/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

public struct ShimmerModifier: ViewModifier {
    let isActive: Bool
    
    public func body(content: _ViewModifier_Content<ShimmerModifier>) -> Self.Body {
        guard isActive else { return AnyView(content) }
        return AnyView(content.overlay(ShimmerView()).clipped())
    }
    
    public typealias Body = AnyView
}

extension View {
    
    public dynamic func shimmer(isActive: Bool) -> ModifiedContent<Self, ShimmerModifier> {
        self.modifier(ShimmerModifier(isActive: isActive))
    }
    
}

struct ShimmerViewDemo : View {
    var shouldShimmer: Bool = true
    
    var body: some View {
        Text("Hello World")
            .shimmer(isActive: shouldShimmer)
            .padding()
    }
}

struct ShimmerView : View {
    @EnvironmentObject private var shimmerConfig: ShimmerConfig
    @ObservedObject private var animationLoop: AnimationLoop = AnimationLoop()
        
    var body: some View {
        let startGradient = Gradient.Stop(color: .clear, location: 0.2)
        let endGradient = Gradient.Stop(color: .clear, location: 0.8)
        let maskGradient = Gradient.Stop(color: Color(white: 1.0, opacity: 0.4), location: 0.5)
        
        let gradient = Gradient(stops: [startGradient, maskGradient, endGradient])
        
        let linearGradient = LinearGradient(gradient: gradient,
                                            startPoint: .leading,
                                            endPoint: .trailing)
        
        return GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .background(self.shimmerConfig.bgColor)
                    .foregroundColor(Color.clear)
                Rectangle()
                    .background(self.shimmerConfig.fgColor)
                    .foregroundColor(.clear)
                    .mask(
                        Rectangle()
                            .foregroundColor(.clear)
                            .background(linearGradient)
                            .rotationEffect(Angle(degrees: 20))
                            .offset(x: !self.animationLoop.isActive ? -geometry.size.width : geometry.size.width, y: 0)
                            .transition(.move(edge: .leading))
                            .animation(.linear(duration: 0.9))
                )
            }.padding(EdgeInsets(top: -(geometry.size.height/2), leading: 0, bottom: -(geometry.size.height/2), trailing: 0))
        }
    }
}


#if DEBUG
struct ShimmerView_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            ShimmerViewDemo()
        }
    }
}
#endif







