//
//  ContentView.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/5/23.
//

import SwiftUI

struct MealListView: View {
    
    @StateObject private var viewModel = MealListViewModel()
    
    @StateObject private var detailsViewModel = DessertDetailsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.desserts.sorted()) { dessert in
                Button {
                    detailsViewModel.pushView(dessert: dessert)
                } label: {
                    DessertCellView(dessert: dessert)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Desserts")
        .sheet(isPresented: $detailsViewModel.showView) {
            DessertDetailsView(viewModel: detailsViewModel)
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
