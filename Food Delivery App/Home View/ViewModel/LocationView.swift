//
//  Untitled.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 29/01/25.
//

import SwiftUI

struct LocationView : View {
    var body: some View {
        HStack(spacing: 0) {
                VStack(alignment: .center) {
                    HStack(spacing: 5) {
                        Image(systemName: "location.fill").foregroundColor(.orange)
                            .padding(.horizontal, 0)
                        Text("Doha, Qatar")
                            .font(.system(size: 18, weight: .bold, design: .default))
                        Image(systemName: "chevron.down").foregroundColor(.gray)
                            .frame(width: 8, height: 8)
                            .padding(.horizontal, 5)
                    }
                    Text("Old Aiport Road")
                        .font(.system(size: 15, weight: .medium, design: .default))
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .frame(width: 40, height:40)
                    .foregroundColor(Color(UIColor.darkGray))
            }.padding()
    }
}

#Preview {
    LocationView()
}
