//
//  RectangleScaleIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/24.
//  
//

import SwiftUI

public struct RectangleScaleIndicator: View {
    @State private var scale: CGFloat = 1
    private let count: Int = 3
    
    public init() {}
    
    public var body: some View {
        Replicator(
            Rectangle()
                .fill(Color.accentColor)
                .frame(width: 8, height: 26)
                .scaleEffect(CGSize(width: 1.0, height: scale))
        )
        .repeatCount(count)
        .repeatTransform(.init(translationX: 12, y: 0))
        .repeatDelay(0.5/Double(count))
        .animation(.easeInOut(duration: 0.5)
                    .delay(0.2)
                    .repeatForever())
        .onAppear(perform: {
            self.scale = 1.5
        })
        .offset(x: -12, y: 0)
    }
}

struct StickActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        RectangleScaleIndicator()
            .accentColor(.gray)
    }
}
