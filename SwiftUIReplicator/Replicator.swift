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
        
        ZStack {
            ForEach(0..<viewModel.repeatCount) { index in
                let content = self.content
                content
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

    private class ReplicatorViewModel: ObservableObject {
        @Published var repeatCount: Int = 0
        @Published var repeatDelay: TimeInterval = 0.0
        @Published var repeatTransform: CGAffineTransform = .identity
        @Published var animation: Animation?
    }
}
