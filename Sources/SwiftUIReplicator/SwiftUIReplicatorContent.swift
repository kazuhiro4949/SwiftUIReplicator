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
            title: "like UIActivityIndicator"
        )
        LibraryItem(
            CircleRotateIndicator(),
            title: "Indicator: rectangle & scale"
        )
        LibraryItem(
            CircleBounceIndicator(),
            title: "Activity Indicator: circle & bounce"
        )
        LibraryItem(
            CircleFedeIndicator(),
            title: "Activity Indicator: circle & fade"
        )
        LibraryItem(
            RectangleScaleIndicator(),
            title: "Indicator: rectangle & scale"
        )
        LibraryItem(
            Replicator(Circle().frame(width: 5, height: 5))
                .repeatCount(3)
                .repeatTransform(CGAffineTransform(translationX: 10, y: 0)),
            title: "Replicator"
        )
    }
}
