//
//  EntranceView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 03.09.2023.
//

import SwiftUI
import ComposableArchitecture

struct EntranceView: View {
    
    private let store: StoreOf<Entrance>
    
    init(store: StoreOf<Entrance>) {
        self.store = store
    }
    
    var body: some View {
        NavigationStackStore( store.scope( state: \.path, action: Entrance.Action.path) ) {
            WithViewStore(store, observe: { $0 }) { _ in
                ZStack {
                    Color(.black)
                    
                    Text("Entrance")
                }
            }
        } destination: { pathStore in
            
        }
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
