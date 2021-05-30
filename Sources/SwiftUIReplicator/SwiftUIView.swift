//
//  SwiftUIView.swift
//  
//
//  Created by Kazuhiro Hayashi on 2021/05/30.
//  
//

import SwiftUI

public struct ActivityIndicator: View {
    public enum Style {
        case classicalMedium
        case classicalLarge
        case circleBounce
        case circleRotate
        case circleScale
        case rectangleScale
    }
    
    public init(style: ActivityIndicator.Style) {
        self.style = style
    }
    
    private let style: Style
    
    public var body: some View {
        switch style {
        case .classicalMedium:
            ClassicalActivityIndicator(style: .medium)
        case .classicalLarge:
            ClassicalActivityIndicator(style: .large)
        case .circleBounce:
            CircleBounceIndicator()
        case .circleRotate:
            CircleRotateIndicator()
        case .circleScale:
            CircleScaleIndicator()
        case .rectangleScale:
            RectangleScaleIndicator()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(style: .classicalLarge)
    }
}
