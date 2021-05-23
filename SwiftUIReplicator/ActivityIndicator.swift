//
//  ActivityIndicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

struct ActivityIndicator: View {
    var body: some View {
        Replicator(
            Capsule(style: .circular)
                .offset(x: -2, y: -28)
                .fill(Color.gray.opacity(1))
                .frame(width: 4, height: 14)
        )
        .repeatCount(12)
        .repeatTransform(CGAffineTransform(rotationAngle: CGFloat((2.0*Double.pi)/Double(12)))
        )
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
    }
}
