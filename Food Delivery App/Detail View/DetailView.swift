//
//  DetailView.swift
//  Food Delivery App
//
//  Created by Monis Manzoor on 30/01/25.
//

import SwiftUI

struct DetailView : View {
    let dish : Dish
    
    var body: some View {
        VStack(alignment: .center) {
                AsyncImage(url: URL(string: dish.image)!, content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 300)
                        .clipped()
                }, placeholder: {
                    ProgressView()
                })
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(dish.description)
                        .font(.body)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.leading)
                    
                    Text(dish.formattedCalories)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }.padding()
        }

        Spacer()
    }
}

#Preview {
    let dish = Dish(id: "1", name: "Sample Dish", description: "XYZ ;KSL;FL;SEFK;SEFLK;SELF;KSLFKL;SDF;LKSKL;FSL;KFLS;KDFL;SFLSL;KDFKL;SFK;LSDFKSKLFL;DSFL;DS;LKDKLDFKL;SDFK;L;LK;F;KLF;KLD;KLF", image: "http://google.com", calories: 100)
    DetailView(dish: dish)
}
