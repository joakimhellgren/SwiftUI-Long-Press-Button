import SwiftUI

public struct LongPressButton<Label>: View where Label : View {
    @Environment(\.colorScheme) private var colorScheme
    
    private let animation: Animation
    private let delay: TimeInterval
    private let action: (Bool) -> Void
    
    @ViewBuilder private let label: () -> Label
    
    public init(
        animation: Animation = .interactiveSpring,
        delay: TimeInterval = 0.5,
        action: @escaping (Bool) -> Void,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.animation = animation
        self.delay = delay
        self.action = action
        self.label = label
    }
    
    @State private var triggerLongPress = false
    @State private var isPressing = false
    
    public var body: some View {
        label()
            .contentShape(Rectangle())
            .opacity(isPressing ? 0.5 : 1.0)
            .scaleEffect(isPressing ? 0.99 : 1)
            .animation(.default, value: isPressing)
            .onTapGesture {
                if !triggerLongPress {
                    action(false)
                }
            }
            .onLongPressGesture(minimumDuration: delay, pressing: {
                isPressing = $0
            }, perform: {
                triggerLongPress = true
                action(true)
                UIImpactFeedbackGenerator().impactOccurred()
            })
            .onChange(of: isPressing) { _ in
                triggerLongPress = false
            }
    }
}
