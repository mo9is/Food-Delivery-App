//
//  ContentView.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 27/01/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel = HomeViewModel(service: WebService())
    
    var body: some View {
        switch self.viewModel.loadingState {
            case .inProgress:
                LoadingView()
                .onAppear {
                    viewModel.fetchAllDishes()
                }
            case .dataLoaded:
            NavigationStack {
                MainView(viewModel: self.viewModel)
                    .background(Color(UIColor.white))
            }
        case .receivedError(message: let message):
            Text(message)
        }
    }
}

#Preview {
    HomeView()
}
