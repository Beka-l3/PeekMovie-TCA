//
//  ApplicationView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import SwiftUI
import ComposableArchitecture

public struct ApplicationView: View {
    private let store: StoreOf<Application>
    
    public init(store: StoreOf<Application>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            SwitchStore(store.scope(
                state: \.screen,
                action: Application.Action.screen
            )) { screenState in
                Group {
                    switch screenState {
                    case .entrance:
                        CaseLet(
                            /ApplicationScreen.State.entrance,
                             action: ApplicationScreen.Action.entrance,
                             then: EntranceView.init
                        )
//                    case .lobby:
//                        CaseLet(
//                            /Application.State.lobby,
//                             action: ApplicationScreen.Action.lobby,
//                             then: LobbyView.init
//                        )
//                    case .splash:
                    default:
                        CaseLet(
                            /ApplicationScreen.State.splash,
                             action: ApplicationScreen.Action.splash,
                             then: SplashView.init
                        )
                    }
                }
                .transition(.opacity)
            }
            .animation(.easeInOut, value: viewStore.screen.id)
        }
    }
}
