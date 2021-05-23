//
//  CGAffineTransform+SyntaxSugar.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

extension CGAffineTransform {
    static func rotateWithDividing(_ number: Double) -> CGAffineTransform {
        CGAffineTransform(
            rotationAngle: CGFloat(
                (2.0*Double.pi)/number
            )
        )
    }
}
