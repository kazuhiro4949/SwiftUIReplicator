//
//  SwiftUIReplicatorContent.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/24.
//  
//

import SwiftUI

public struct SwiftUIReplicatorContent: LibraryContentProvider {
    public var views: [LibraryItem] {
        LibraryItem(
            ActivityIndicator(style: .classicalLarge),
            title: "Indicator: rectangle & scale"
        )
        LibraryItem(
            ClassicalActivityIndicator(style: .large),
            title: "An activity indicator like UIActivtyIndicator."
        )
        LibraryItem(
            CircleRotateIndicator(),
            title: "An activity indicator with rotating circle"
        )
        LibraryItem(
            CircleBounceIndicator(),
            title: "An activity indicator with bouncing circle"
        )
        LibraryItem(
            CircleFedeIndicator(),
            title: "An activity indicator with fading circle"
        )
        LibraryItem(
            RectangleScaleIndicator(),
            title: "An activity indicator with scaling rectangle"
        )
        LibraryItem(
            Replicator(Circle().frame(width: 5, height: 5))
                .repeatCount(3)
                .repeatTransform(CGAffineTransform(translationX: 10, y: 0)),
            title: "Replicator"
        )
    }
}
