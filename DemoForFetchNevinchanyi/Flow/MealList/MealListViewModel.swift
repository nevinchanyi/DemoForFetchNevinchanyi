//
//  MealListViewModel.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/6/23.
//

import Foundation


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
        /** Ideally we must show the error somewhere in UI if there is an error in `catch` block. */
        let meals: Meals = try await networkService.request(endpoint: Endpoint.search(category: "Dessert"),
                                                            timeoutInterval: 10.0)
        
        await MainActor.run {
            self.desserts = meals.meals
        }
    }
}
