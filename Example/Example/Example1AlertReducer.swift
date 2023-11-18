import ComposableArchitecture
import Dependencies

public struct Example1AlertReducer: Reducer {
    // MARK: - State
    public struct State: Equatable {
        public init() {}
    }

    // MARK: - Action
    public enum Action: Equatable {
        case closeButtonTapped
    }

    // MARK: - Dependencies
    @Dependency(\.dismiss) private var dismiss
    public init() {}

    // MARK: - Reducer
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .closeButtonTapped:
                return .run { _ in
                    await dismiss()
                }
            }
        }
    }
}
