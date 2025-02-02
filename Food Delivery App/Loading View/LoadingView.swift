//
//  LoadingView.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 27/01/25.
//

import SwiftUI

struct LoadingView : View {
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Pulling Data from server. Please wait...")
                    .foregroundColor(Color.gray)
                    .font(.callout)
                ProgressView()
            }
        }
    }
}

#Preview {
    LoadingView()
}
