//
//  CirculateModifier.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

extension View {
    func circulate(width: CGFloat, height: CGFloat, ratio: CGFloat = 1) -> some View {
        modifier(CirculateModifier(width: width, height: height, ratio: ratio))
    }
}

struct CirculateModifier: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    let ratio: CGFloat
    
    func body(content: Content) -> some View {
        content
            .offset(x: -width/2, y: -height * ratio * 2)
            .frame(width: width, height: height)
    }
}
