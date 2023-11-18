import SwiftUI
import ComposableArchitecture
import ComposableFullscreenPopup

public struct ContentView: View {
    let store: StoreOf<ContentReducer>
    @ObservedObject private var viewStore: ViewStore<ViewState, ContentReducer.Action>

    public init(store: StoreOf<ContentReducer>) {
        self.store = store
        self.viewStore = ViewStore(store, observe: ViewState.init(state:))
    }

    struct ViewState: Equatable {
        init(state: ContentReducer.State) {
        }
    }

    public var body: some View {
        Button {
            viewStore.send(.buttonTapped)
        } label: {
            Text("Popup")
        }
        .popup(store.scope(state: \.$example1Alert, action: { .example1Alert($0) })) { store in
            Example1AlertView(store: store)
        }
    }
}
