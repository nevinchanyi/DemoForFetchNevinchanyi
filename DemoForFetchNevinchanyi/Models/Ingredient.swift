//
//  Ingredient.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/6/23.
//

import Foundation

struct Ingredient: Identifiable {
    var name: String
    var measure: String?
    
    init(name: String, measure: String?) {
        self.name = name
        self.measure = measure
    }
    
    var id = UUID().uuidString
}
