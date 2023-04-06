//
//  DessertDetailsView.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/6/23.
//

import SwiftUI

struct DessertDetailsView: View {
    
    @StateObject var viewModel: DessertDetailsViewModel
    
    var body: some View {
        NavigationView {
            List {
                
                Section {
                    Text(viewModel.dessert.instructions ?? "N/A")
                        .font(.footnote)
                } header: {
                    Text("Instructions")
                }
                
                
                Section {
                    ForEach(viewModel.dessert.ingredientList) { ingredient in
                        HStack {
                            Text(ingredient.name.capitalized)
                            
                            Spacer()
                            
                            Text(ingredient.measure ?? "N/A")
                        }
                    }
                } header: {
                    Text("Ingredients")
                }
            }
            .navigationTitle(viewModel.dessert.name)
        }
    }
}

struct DessertDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DessertDetailsView(viewModel: DessertDetailsViewModel())
    }
}
