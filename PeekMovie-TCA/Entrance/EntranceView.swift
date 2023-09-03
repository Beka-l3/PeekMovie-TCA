//
//  EntranceView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 03.09.2023.
//

import SwiftUI
import ComposableArchitecture

public struct EntranceView: View {
    
    private let store: StoreOf<Entrance>
    
    public init(store: StoreOf<Entrance>) {
        self.store = store
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct EntranceView_Previews: PreviewProvider {
    static var previews: some View {
        EntranceView(store: .init(
            initialState: Entrance.State()) {
                Entrance()
            }
        )
    }
}
