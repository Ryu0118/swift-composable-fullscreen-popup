import ComposableArchitecture
import Dependencies

@Reducer
public struct ContentReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        @PresentationState var example1Alert: Example1AlertReducer.State?

        public init() {}
    }

    // MARK: - Action
    public enum Action: Equatable {
        case buttonTapped
        case example1Alert(PresentationAction<Example1AlertReducer.Action>)
    }

    // MARK: - Dependencies

    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .buttonTapped:
                state.example1Alert = .init()
                return .none

            case .example1Alert:
                return .none
            }
        }
        .ifLet(\.$example1Alert, action: \.example1Alert) {
            Example1AlertReducer()
        }
    }
}
