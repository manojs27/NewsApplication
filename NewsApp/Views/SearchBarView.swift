//
//  SearchBar.swift
//  NewsApp
//
//  Created by Sudarshan,Manoj on 13/10/19.
//  Copyright © 2019 Sudarshan,Manoj. All rights reserved.
//

import SwiftUI

struct SearchBarView: View {
   @Binding var text: String
   @State var action: () -> Void

   var body: some View {
       ZStack {
           HStack {
               TextField("Search News", text: $text)
                   .padding([.leading, .trailing], 8)
                   .frame(height: 32)
                   .background(Color.black.opacity(0.1))
                   .cornerRadius(8)

               Button(
                   action: action,
                   label: { Text("Search") }
                   )
                   .foregroundColor(Color.black)
               }
               .padding([.leading, .trailing], 16)
           }
           .frame(height: 64)
   }
}
