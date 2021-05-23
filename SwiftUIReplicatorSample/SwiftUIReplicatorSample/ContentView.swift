//
//  ContentView.swift
//  SwiftUIReplicatorSample
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI
import SwiftUIReplicator

struct ContentView: View {
    var body: some View {
        Replicator(
            Circle()
                .offset(x: -30, y: 0)
                .fill(Color.red.opacity(1))
                .frame(width: 10, height: 10)
        )
        .repeatCount(7)
        .repeatTransform(CATransform3DGetAffineTransform(
                            CATransform3DMakeRotation(
                                CGFloat((2.0*Double.pi)/Double(7)),
                                0,
                                0,
                                1))
        )
        .repeatDelay(0.3)
        .animation(.easeIn.repeatForever())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
