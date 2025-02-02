//
//  CardView.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 28/01/25.
//

import SwiftUI

struct CategoryCardView : View {
    let categories : [DishCategory]
    
    var body: some View {
        VStack(alignment: .leading, spacing : 15) {
            CardWrapperView(self.categories) {}
        }
    }
}

struct CardWrapperView<Content : View> : View {
    let content : () -> Content
    let categories : [DishCategory]
    
    init(_ categories : [DishCategory], @ViewBuilder content : @escaping () -> Content) {
        self.categories = categories
        self.content = content
    }
    
    var body: some View {
        
        let totalNumberOfItemsCount = self.categories.count - 1
        let numberOfColums : Int = 2
        
        ForEach(0..<self.categories.count, id: \.self) { i in
            HStack(spacing: 15) {
                if i * numberOfColums <= totalNumberOfItemsCount {
                    CardView(category: categories[i * numberOfColums])
                        .borderForCard()
                }
                if i * numberOfColums + 1 <= totalNumberOfItemsCount {
                    CardView(category: categories[((i * numberOfColums)+1)])
                        .borderForCard()
                }
            }
        }
        self.content()
    }
}

struct CardView : View {
    var category : DishCategory
    
    var body: some View {
        VStack {
            Text("\(category.name)")
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            AsyncImage(url: URL(string: category.image)!, content: { anImage in
                anImage.resizable().aspectRatio(contentMode: .fill)
            }, placeholder: {
                ProgressView()
            }).frame(maxWidth: 60, maxHeight: 60)
        }
        .padding(5)
    }
}

struct CardCategoryModifier : ViewModifier {
    let oneCardW : CGFloat = ceil(UIScreen.main.bounds.width/2 - 45)
    let oneCardH : CGFloat = 150
    
    func body(content: Content) -> some View {
        content
            .frame(width:oneCardW, height: oneCardH)
            .overlay(
                   RoundedRectangle(cornerRadius: 4)
                    .stroke(Color(UIColor(white: 0.85, alpha: 1.0)),  lineWidth:  CGFloat(UIScreen.main.scale/2.0))
               )
    }
}

extension View {
    func borderForCard() -> some View {
        ModifiedContent(content: self, modifier: CardCategoryModifier())
    }
}
