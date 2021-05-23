//
//  CirculateModifier.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

extension View {
    func circulate(width: CGFloat, height: CGFloat) -> some View {
        modifier(CirculateModifier(width: width, height: height))
    }
}

struct CirculateModifier: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .offset(x: -width/2, y: -height*2)
            .frame(width: width, height: height)
    }
}
