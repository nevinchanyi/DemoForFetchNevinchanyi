//
//  DessertDetailsViewModel.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/6/23.
//

import Foundation


final class DessertDetailsViewModel: ObservableObject {
    
    private let networkService: NetworkServable
    @Published var dessert: Dessert
    @Published var showView = false
    
    init(networkService: NetworkServable = NetworkService(),
        dessert: Dessert = Dessert(id: "", name: "", thumbnail: "")) {
        self.networkService = networkService
        self.dessert = dessert
    }
    
    func pushView(dessert: Dessert) {
        Task {
            await MainActor.run {
                self.dessert = dessert
                self.showView = true
            }
            do {
                try await requestDessertDetails(dessert: dessert)
            } catch {
                print(error) /** Ideally we must show the error somewhere in UI. */
            }
        }
    }
    
    func onDismiss() {
        dessert = Dessert(id: "", name: "", thumbnail: "")
    }
    
    func requestDessertDetails(dessert: Dessert) async throws {
        let response: Meals = try await networkService.request(endpoint: Endpoint.details(mealId: dessert.id),
                                                               timeoutInterval: 10.0)
        guard let dessertWithDetails = response.meals.first else { return }
        
        await MainActor.run {
            self.dessert = dessertWithDetails
        }
    }
}
