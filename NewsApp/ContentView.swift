//
//  ContentView.swift
//  NewsApp
//
//  Created by Sudarshan,Manoj on 12/10/19.
//  Copyright © 2019 Sudarshan,Manoj. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = SearchNewsViewModel()

    var body: some View {
       NavigationView {
           VStack {
               SearchBarView(text: $viewModel.name) {
                   self.viewModel.search()
               }

            List(viewModel.cards) { card in
                SearchNewsRowView(viewModel: self.viewModel, card: card)
                       .onAppear { self.viewModel.fetchImage(for: card)}
               }
            }
            .navigationBarTitle(Text("' Any good news ?"))
       }
    }
}
