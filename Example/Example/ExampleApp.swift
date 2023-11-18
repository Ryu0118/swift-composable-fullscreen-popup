//
//  ExampleApp.swift
//  Example
//
//  Created by 渋谷龍之介 on 2023/11/18.
//

import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: .init(initialState: .init()) {
                    ContentReducer()
                }
            )
        }
    }
}
