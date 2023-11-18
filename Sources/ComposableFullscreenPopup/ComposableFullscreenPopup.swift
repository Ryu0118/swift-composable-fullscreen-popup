import SwiftUI
import FullscreenPopup
@_spi(Presentation) import ComposableArchitecture

public extension View {
    /// Presents a popup with customizable content and background.
    ///
    /// - Note: The `duration` parameter must be greater than the `duration` of the `animation`.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the popup.
    ///   - nanoseconds: The duration of the popup animation in nanoseconds. Default is 350,000,000 nanoseconds.
    ///                  Ensure this duration is longer than the animation's duration.
    ///   - animation: The animation to use when presenting the popup. Default is a spring animation.
    ///   - popup: A closure returning the popup content. The closure takes a Boolean indicating the presentation state.
    ///   - background: A closure returning the background content. The closure takes a Boolean indicating the presentation state.
    /// - Returns: A view with the popup applied.
    func popup<State, Action, Popup: View, Background: View>(
        _ store: Store<PresentationState<State>, PresentationAction<Action>>,
        duration nanoseconds: UInt64 = 350_000_000,
        animation: Animation = .spring(duration: 0.3, bounce: 0.25, blendDuration: 0.1),
        @ViewBuilder background: @escaping (_ isPresented: Bool) -> Background = { Color.black.opacity($0 ? 0.5 : 0) },
        @ViewBuilder content: @escaping (_ store: Store<State, Action>) -> Popup
    ) -> some View {
        self.presentation(store: store) { `self`, $item, destination in
            popup(
                isPresented: $item.isPresented(),
                duration: nanoseconds,
                animation: animation,
                background: background,
                content: {
                    destination(content)
                }
            )
        }
    }

    /// Presents a popup with customizable content and background. Available from macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0.
    ///
    /// - Note: The `duration` parameter must be greater than the `duration` of the `animation`.
    ///
    /// - Parameters:
    ///   - isPresented: A binding to a Boolean value that determines whether to present the popup.
    ///   - duration: The duration of the popup animation. Default is 0.35 seconds.
    ///               Ensure this duration is longer than the animation's duration.
    ///   - animation: The animation to use when presenting the popup. Default is a spring animation.
    ///   - popup: A closure returning the popup content. The closure takes a Boolean indicating the presentation state.
    ///   - background: A closure returning the background content. The closure takes a Boolean indicating the presentation state.
    /// - Returns: A view with the popup applied.
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    @_disfavoredOverload
    func popup<State, Action, Popup: View, Background: View>(
        _ store: Store<PresentationState<State>, PresentationAction<Action>>,
        duration: Duration = .seconds(0.35),
        animation: Animation = .spring(duration: 0.3, bounce: 0.25, blendDuration: 0.1),
        @ViewBuilder background: @escaping (_ isPresented: Bool) -> Background = { Color.black.opacity($0 ? 0.5 : 0) },
        @ViewBuilder content: @escaping (_ store: Store<State, Action>) -> Popup
    ) -> some View {
        self.presentation(store: store) { `self`, $item, destination in
            popup(
                isPresented: $item.isPresented(),
                duration: duration,
                animation: animation,
                background: background,
                content: {
                    destination(content)
                }
            )
        }
    }
}
