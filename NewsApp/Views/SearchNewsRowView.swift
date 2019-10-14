//
//  SearchNewsRow.swift
//  NewsApp
//
//  Created by Sudarshan,Manoj on 13/10/19.
//  Copyright © 2019 Sudarshan,Manoj. All rights reserved.
//

import SwiftUI
import Foundation

struct SearchNewsRowView: View {
     @ObservedObject var viewModel: SearchNewsViewModel
     @State var card: Card

       var body: some View {
        VStack(alignment: .leading){
           HStack {
               viewModel.cardImages[card].map { image in
                Image(uiImage: image).resizable()
                       .frame(width: 120, height: 80 , alignment: Alignment.center)
                       .scaledToFill()
                       .clipped()
               }

            Text(card.name)
                .font(Font.system(size: 14))
               }
            
            Spacer()
            
            HStack{
            Text(card.source)
                .font(Font.system(size: 14).bold())
                
                Text(card.published_at)
                .font(Font.system(size: 14))
            }
        }
        .frame(height: 100)
       }
    
}
