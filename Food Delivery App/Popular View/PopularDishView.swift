//
//  PopularDishView.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 29/01/25.
//

import SwiftUI

struct PopularDishView : View {
    let dish : Dish
    
    var body: some View {
        VStack(spacing: 5) {
            AsyncImage(url: URL(string: dish.image)!) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity, height : 100)
                    .clipped()
            } placeholder: {
                ProgressView()
            }.frame(height: 100)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("\(dish.name)")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                
                Text("\(dish.description)")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                
                Text("\(dish.formattedCalories)")
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
            }.padding()
        }
    }
}
