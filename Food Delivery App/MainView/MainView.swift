//
//  MainView.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 28/01/25.
//

import SwiftUI

struct MainView : View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .center) {
                LocationView()
                if let dishes = viewModel.allDishes, let categories = dishes.categories {
                    CategoryCardView(categories: categories)
                        .padding(.bottom)
                }
                VStack {
                    SectionView(title: "Popular Dishes")
                        .frame(maxWidth: .infinity, maxHeight: 30)
                    ScrollView(.horizontal) {
                            HStack(spacing : 15) {
                                ForEach(viewModel.allDishes?.populars ?? []) { popular in
                                    NavigationLink(destination: DetailView(dish: popular).navigationTitle(popular.name)) {
                                        PopularDishView(dish: popular)
                                            .frame(width: 200)
                                            .border(Color(UIColor(white: 0.85, alpha: 1.0)), width: CGFloat(UIScreen.main.scale/2.0))
                                            .cornerRadius(4)
                                    }
                                }
                        }.frame(height : 300)
                    }
                }.padding()
                
                VStack(spacing : 15) {
                    SectionView(title: "Recommended Dishes")
                        .frame(maxWidth: .infinity, maxHeight: 30)
                    
                    ForEach(viewModel.allDishes?.specials ?? []) { special in
                        NavigationLink(destination: DetailView(dish: special)) {
                            RecommendedView(dish: special)
                                .frame(height: 130)
                                .border(Color(UIColor(white: 0.85, alpha: 1.0)), width: CGFloat(UIScreen.main.scale/2.0))
                                .cornerRadius(4)
                        }.padding(.top, 0)
                    }
                }.padding()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SectionView : View {
    var title : String
    
    var body: some View {
        HStack {
            Text("\(title)")
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(.black)
            Spacer()
            Button("See All") {
                
            }.font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(.orange)
        }.padding()
    }
}
