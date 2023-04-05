//
//  Endpoint.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/5/23.
//

import Foundation

protocol EndpointInterface {
    var url: URL? { get }
}

enum Endpoint: EndpointInterface {
    case search(category: String)
    case details(mealId: String)
    
    var baseUrl: String { "https://themealdb.com" }
    var path: String {
        switch self {
        case .search(let category): return "/api/json/v1/1/filter.php?c=\(category)" // https://themealdb.com/api/json/v1/1/filter.php?c=Dessert
        case .details(let mealId): return "/api/json/v1/1/lookup.php?i=\(mealId)" // https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID
        }
    }
    var url: URL? {
        URL(string: baseUrl + path)
    }
}
