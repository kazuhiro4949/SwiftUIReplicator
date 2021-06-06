//
//  Replicator.swift
//  SwiftUIReplicator
//
//  Created by Kazuhiro Hayashi on 2021/05/23.
//  
//

import SwiftUI


/// A view that creates a specified number of subview copies with varying geometric, temporal, and color transformations.
public struct Replicator<Content: View>: View {
    private let content: Content
    
    @ObservedObject private var viewModel = ReplicatorViewModel()
    
    public init(_ content: Content) {
        self.content = content
    }
    
    public var body: some View {
        var incrementer = Incrementer(viewModel: viewModel)
        
        ZStack {
            ForEach(0..<viewModel.repeatCount) { index in
                let content = self.content
                content
                    .colorMultiply(incrementer.color())
                    .transformEffect(incrementer.transform())
                    .animation(
                        viewModel
                            .animation?
                            .delay(incrementer.delay())
                    )
            }
        }
    }
    
    
    /// The number of copies to create, including the source views.
    /// - Parameter repeatCount: The number of copies
    /// - Returns: self
    public func repeatCount(_ repeatCount: Int) -> Replicator<Content> {
        viewModel.repeatCount = repeatCount
        return self
    }
    
    
    /// Specifies the aniation delay, in seconds, between replicated copies
    /// - Parameter repeatDelay: repeat delay
    /// - Returns: self
    public func repeatDelay(_ repeatDelay: TimeInterval) -> Replicator<Content> {
        viewModel.repeatDelay = repeatDelay
        return self
    }
    
    
    /// sets the animation to each view.
    /// - Parameter animation: animation
    /// - Returns: self
    public func animation(_ animation: Animation) -> Replicator<Content> {
        viewModel.animation = animation
        return self
    }
    
    
    /// The transform matrix applied to the previous instance to produce the current instance.
    /// - Parameter repeatTransform: transform
    /// - Returns: self
    public func repeatTransform(_ repeatTransform: CGAffineTransform) -> Replicator<Content> {
        viewModel.repeatTransform = repeatTransform
        return self
    }
    
    
    /// Defines the offset added to the red component of the color for each replicated instance..
    /// - Parameter instanceRedOffset: red offset
    /// - Returns: self
    public func instanceRedOffset(_ instanceRedOffset: Double) -> Replicator<Content> {
        viewModel.instanceRedOffset = instanceRedOffset
        return self
    }
    
    /// Defines the offset added to the green component of the color for each replicated instance..
    /// - Parameter instanceGreenOffset: green offset
    /// - Returns: self
    public func instanceGreenOffset(_ instanceGreenOffset: Double) -> Replicator<Content> {
        viewModel.instanceGreenOffset = instanceGreenOffset
        return self
    }
    
    /// Defines the offset added to the blue component of the color for each replicated instance..
    /// - Parameter instanceBlueOffset: blue offset
    /// - Returns: self
    public func instanceBlueOffset(_ instanceBlueOffset: Double) -> Replicator<Content> {
        viewModel.instanceBlueOffset = instanceBlueOffset
        return self
    }
}

//MARK:- ViewModel

extension Replicator {
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

// MARK:- Utility

extension Replicator {
    private struct Incrementer {
        var repeatTransform: RepeatTransform
        var repeatDelay: RepeatDelay
        var repeatColor: RepeatColorOffset
        
        init(viewModel: ReplicatorViewModel) {
            repeatTransform = RepeatTransform(value: viewModel.repeatTransform)
            repeatDelay = RepeatDelay(value: viewModel.repeatDelay)
            repeatColor = RepeatColorOffset(
                value: .init(
                    red: viewModel.instanceRedOffset,
                    blue: viewModel.instanceBlueOffset,
                    green: viewModel.instanceGreenOffset
                )
            )
        }
        
        mutating func color() -> Color {
            let color = repeatColor.increment()
            return Color(
                red: color.red,
                green: color.green,
                blue: color.blue, opacity: 1)
        }
        
        mutating func transform() -> CGAffineTransform {
            repeatTransform.increment()
        }
        
        mutating func delay() -> TimeInterval {
            repeatDelay.increment()
        }
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
        var value: ColorComponents
        var pointer: ColorComponents?
        
        mutating func increment() -> ColorComponents {
            let pointer = pointer.flatMap { $0.appending(value) } ?? .white
            self.pointer = pointer
            return pointer
        }
    }
    
    struct ColorComponents {
        let red: Double
        let blue: Double
        let green: Double
        
        static var white: ColorComponents {
            ColorComponents(red: 1, blue: 1, green: 1)
        }
        
        func appending(_ components: ColorComponents) -> ColorComponents {
            let red = min(max(0, self.red + components.red), 1)
            let blue = min(max(0, self.blue + components.blue), 1)
            let green = min(max(0, self.green + components.blue), 1)
            return .init(red: red, blue: blue, green: green)
        }
    }
}
