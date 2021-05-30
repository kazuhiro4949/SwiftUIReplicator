//
//  Replicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI

public struct Replicator<Content: View>: View {
    let content: Content
    
    @ObservedObject private var viewModel = ReplicatorViewModel()
    
    public init(_ content: Content) {
        self.content = content
    }
    
    public var body: some View {
        var repeatTransform = RepeatTransform(value: viewModel.repeatTransform)
        var repeatDelay = RepeatDelay(value: viewModel.repeatDelay)
        var repeatColor = RepeatColorOffset(
            value: (viewModel.instanceRedOffset, viewModel.instanceBlueOffset, viewModel.instanceGreenOffset)
        )
        
        
        ZStack {
            ForEach(0..<viewModel.repeatCount) { index in
                let content = self.content
                let color = repeatColor.increment()
                content
                    .colorMultiply(
                        Color(
                            red: color.red,
                            green: color.green,
                            blue: color.blue, opacity: 1)
                    )
                    .transformEffect(repeatTransform.increment())
                    .animation(
                        viewModel
                            .animation?
                            .delay(repeatDelay.increment())
                    )
            }
        }
    }
    
    public func repeatCount(_ repeatCount: Int) -> Replicator<Content> {
        viewModel.repeatCount = repeatCount
        return self
    }
    
    public func repeatDelay(_ repeatDelay: TimeInterval) -> Replicator<Content> {
        viewModel.repeatDelay = repeatDelay
        return self
    }
    
    public func animation(_ animation: Animation) -> Replicator<Content> {
        viewModel.animation = animation
        return self
    }
    
    public func repeatTransform(_ repeatTransform: CGAffineTransform) -> Replicator<Content> {
        viewModel.repeatTransform = repeatTransform
        return self
    }
    
    
    public func instanceRedOffset(_ instanceRedOffset: Double) -> Replicator<Content> {
        viewModel.instanceRedOffset = instanceRedOffset
        return self
    }
    
    public func instanceGreenOffset(_ instanceGreenOffset: Double) -> Replicator<Content> {
        viewModel.instanceGreenOffset = instanceGreenOffset
        return self
    }
    public func instanceBlueOffset(_ instanceBlueOffset: Double) -> Replicator<Content> {
        viewModel.instanceBlueOffset = instanceBlueOffset
        return self
    }
    
    
    private struct RepeatTransform {
        var value: CGAffineTransform
        var pointer: CGAffineTransform?
        
        mutating func increment() -> CGAffineTransform {
            let pointer = pointer?.concatenating(value) ?? .identity
            self.pointer = pointer
            return pointer
        }
    }
    
    private struct RepeatDelay {
        var value: TimeInterval
        var pointer: TimeInterval?
        
        mutating func increment() -> TimeInterval {
            let pointer = pointer.flatMap { $0 + value } ?? 0
            self.pointer = pointer
            return pointer
        }
    }
    
    private struct RepeatColorOffset {
        var value: (red: Double, blue: Double, green: Double)
        var pointer: (red: Double, blue: Double, green: Double)?
        
        mutating func increment() -> (red: Double, blue: Double, green: Double) {
            let pointer = pointer.flatMap {
                (min(max(0, $0.red + value.red), 1),
                 min(max(0, $0.blue + value.blue), 1),
                 min(max(0, $0.green + value.green), 1))
            } ?? (1, 1, 1)
            self.pointer = pointer
            return pointer
        }
    }

    private class ReplicatorViewModel: ObservableObject {
        @Published var repeatCount: Int = 0
        @Published var repeatDelay: TimeInterval = 0.0
        @Published var repeatTransform: CGAffineTransform = .identity
        @Published var instanceRedOffset: Double = 0
        @Published var instanceBlueOffset: Double = 0
        @Published var instanceGreenOffset: Double = 0
        @Published var animation: Animation?
    }
}


#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

extension Color {
    #if canImport(UIKit)
    var native: UIColor { UIColor(self) }
    #elseif canImport(AppKit)
    var native: NSColor { NSColor(self) }
    #endif
    
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var _rgba = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        native.getRed(&_rgba.0, green: &_rgba.1, blue: &_rgba.2, alpha: &_rgba.3)
        return _rgba
    }
}
