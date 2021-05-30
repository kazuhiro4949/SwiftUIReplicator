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
