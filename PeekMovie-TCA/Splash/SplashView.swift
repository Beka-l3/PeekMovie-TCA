//
//  SplashView.swift
//  PeekMovie-TCA
//
//  Created by Bekzhan Talgat on 31.08.2023.
//

import SwiftUI
import ComposableArchitecture

struct SplashView: View {
    
    @Dependency(\.mainQueue) private var mainQueue
    @State private var canShowLoadingSpinner: Bool = false
    
    private let store: StoreOf<Splash>
    
    public init(store: StoreOf<Splash>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(store, observe: { $0 }) { viewStore in
            ZStack {
                Color(.purple)
                    .ignoresSafeArea()
                
                VStack {
                    Text(viewStore.title)
                        .adaptiveFont(.primary, .bold, ofSize: 28)
                    
                    Spacer()
                        .adaptiveFrame(height: 64)
                    
                    Group {
                        if canShowLoadingSpinner, viewStore.isShowingLoadingSpinner {
                            ProgressView()
                                .tint(.white)
                                .transition(.opacity)
                                .animation(.easeInOut, value: canShowLoadingSpinner)
                        } else {
                            Spacer()
                        }
                    }
                    .adaptiveFrame(size: .square(52))
                }
                .foregroundColor(Asset.Color.alabaster.swiftUIColor)
            }
            .onFirstAppear {
                mainQueue.schedule(after: .init(.now() + 0.25)) {
                    canShowLoadingSpinner = true
                }
                
                viewStore.send(.view(.didAppearFirstTime))
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(store: .init(
            initialState: .init(timer: .init(totalTicks: UInt(10)), title: "Splash")) {
                Splash()
            }
        )
    }
}
