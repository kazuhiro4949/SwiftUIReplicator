//
//  ClassicalActivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

/// An activity indicator like UIActivtyIndicator.
public struct ClassicalActivityIndicator: View {
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
    
    @State private var fillColor = Color(white: 0.9, opacity: 1)
    
    private let style: Style
    private let count = 8
    
    
    /// Creates an indicator with style
    /// - Parameter style: medium or large
    public init(style: Style) {
        self.style = style
    }
    
    public var body: some View {
        Replicator(
            Capsule(style: .circular)
                .fill(fillColor)
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
        .repeatCount(count)
        .repeatDelay(1/Double(CGFloat(count)))
        .repeatTransform(
            .init(
                rotationAngle:
                    (2.0*CGFloat.pi)/CGFloat(count)
            )
        )
        .animation(
            .linear(duration: 0.2)
                .delay(0.3)
                .repeatForever()
        )
        .onAppear(perform: {
            self.fillColor = Color.activityIndicator
        })
    }
}

struct ClassicalActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ClassicalActivityIndicator(style: .large)
    }
}
