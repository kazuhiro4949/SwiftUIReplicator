//
//  DefaultActivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

public struct DefaultActivityIndicator: View {
    public enum Style {
        case medium
        case large
        
        public var scale: CGFloat {
            switch self {
            case .medium: return 1
            case .large: return 1.5
            }
        }
    }
    
    @State private var isAnimating = false
    
    public let style: Style
    
    public init(style: Style) {
        self.style = style
    }
    
    public var body: some View {
        Replicator(
            Capsule(style: .circular)
                .fill(
                    isAnimating ? Color(white: 0.9, opacity: 1) : Color.activityIndicator
                )
                .frame(
                    width: 2.5 * style.scale,
                    height: 6 * style.scale
                )
                .transformEffect(
                    .init(
                        translationX: -1.25 * style.scale,
                        y:  -9.5 * style.scale
                    )
                )
        )
        .repeatCount(8)
        .repeatDelay(1/8)
        .repeatTransform(
            CGAffineTransform(
                rotationAngle: CGFloat(
                    (2.0*Double.pi)/8
                )
            )
        )
        .animation(
            .linear(duration: 0.2)
                .delay(0.3)
                .repeatForever()
        )
        .onAppear(perform: {
            self.isAnimating = true
        })
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DefaultActivityIndicator(style: .large)
    }
}
