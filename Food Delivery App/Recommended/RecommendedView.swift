//
//  Recommended.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 30/01/25.
//


import SwiftUI

struct RecommendedView: View {
    let dish : Dish
    
    var body: some View {
        HStack() {
            VStack(alignment: .center) {
                AsyncImage(url: URL(string: dish.image)!) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }.frame(width: 100)
                .cornerRadius(10)
            }
            VStack(alignment : .leading, spacing: 4) {
                Text(dish.name)
                    .font(.system(size: 18, weight: .bold, design: .default))
                    .foregroundColor(.black)
                
                Text("\(dish.description)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                
                Text("\(dish.formattedCalories)")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.black)
            }.padding(10)
        }
    }
}


