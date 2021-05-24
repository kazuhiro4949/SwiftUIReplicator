//
//  DefaultActivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

struct DefaultActivityIndicator: View {
    enum Style {
        case medium
        case large
        
        var scale: CGFloat {
            switch self {
            case .medium: return 1
            case .large: return 1.5
            }
        }
    }
    
    @State private var isAnimating = false
    
    let style: Style
    
    public init(style: Style) {
        self.style = style
    }
    
    var body: some View {
        Replicator(
            Capsule(style: .circular)
                .offset(
                    x: -1.25 * style.scale,
                    y: -9.5 * style.scale
                )
                .fill(
                    Color.activityIndicator
                        .opacity(isAnimating ? 0.1 : 1)
                )
                .frame(
                    width: 2.5 * style.scale,
                    height: 6 * style.scale
                )
        )
        .repeatCount(8)
        .repeatDelay(1/8)
        .repeatTransform(.rotateWithDividing(8))
        .animation(
            .linear(duration: 0.6)
                .repeatForever()
        )
        .onAppear(perform: {
            self.isAnimating = true
        })
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DefaultActivityIndicator(style: .medium)
    }
}
