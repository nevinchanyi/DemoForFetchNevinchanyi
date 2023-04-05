//
//  DemoForFetchNevinchanyiApp.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/5/23.
//

import SwiftUI

@main
struct DemoForFetchNevinchanyiApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MealListView()
            }
            .colorScheme(.light)
        }
    }
}
