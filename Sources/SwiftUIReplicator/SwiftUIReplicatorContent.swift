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
            DefaultActivityIndicator(style: .medium),
            title: "Indicator like UIActivityIndicator"
        )
        LibraryItem(
            CircleActivityIndicator(),
            title: "Indicator: four balls in line"
        )
        LibraryItem(
            StickActivityIndicator(),
            title: "Indicator: scaling sticks"
        )
        LibraryItem(
            Replicator(Circle().frame(width: 5, height: 5))
                .repeatCount(3)
                .repeatTransform(CGAffineTransform(translationX: 10, y: 0)),
            title: "Replicator"
        )
        
    }
}
