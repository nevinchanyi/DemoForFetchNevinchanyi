//
//  ContentView.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/5/23.
//

import SwiftUI

struct MealListView: View {
    
    @StateObject private var viewModel = MealListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.desserts.sorted()) { dessert in
                DessertCellView(dessert: dessert)
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Desserts")
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
