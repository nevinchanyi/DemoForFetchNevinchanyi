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
        VStack {
            ForEach(viewModel.desserts.sorted()) { dessert in
                Text(dessert.name)
            }
        }
        .padding()
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}


final class MealListViewModel: ObservableObject {
    
    private let networkService: NetworkServable
    @Published var desserts: [Dessert]
    
    init(networkService: NetworkServable = NetworkService(),
        desserts: [Dessert] = []) {
        self.networkService = networkService
        self.desserts = desserts
        Task(priority: .background) {
            do {
                try await requestDesserts()
            } catch {
                print(error)
            }
        }
    }
    
    func requestDesserts() async throws {
        let meals: Meals = try await networkService.request(endpoint: Endpoint.search(category: "Dessert"),
                                                            timeoutInterval: 10.0)
        
        await MainActor.run {
            self.desserts = meals.meals
        }
    }
}
