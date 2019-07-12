//
//  ContentView.swift
//  TestApp
//
//  Created by Vidhyadharan Mohanram on 24/06/19.
//  Copyright © 2019 Vid. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        Text("Hello World")
            .shimmer(isActive: .constant(true))
            .padding()
            .environmentObject(ShimmerConfig())
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
