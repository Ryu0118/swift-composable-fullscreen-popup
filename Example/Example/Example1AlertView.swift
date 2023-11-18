import SwiftUI
import ComposableArchitecture

public struct Example1AlertView: View {
    let store: StoreOf<Example1AlertReducer>
    @ObservedObject private var viewStore: ViewStore<ViewState, Example1AlertReducer.Action>

    public init(store: StoreOf<Example1AlertReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: ViewState.init(state:))
    }

    struct ViewState: Equatable {
        init(state: Example1AlertReducer.State) {
        }
    }

    public var body: some View {
        VStack {
            Text("An error has occurred!!")
                .font(.title)

            HStack {
                Button {
                    viewStore.send(.closeButtonTapped)
                } label: {
                    Text("OK")
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
