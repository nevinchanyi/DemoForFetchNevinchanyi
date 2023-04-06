//
//  DessertCellView.swift
//  DemoForFetchNevinchanyi
//
//  Created by Kostiantyn Nevinchanyi on 4/6/23.
//

import SwiftUI

struct DessertCellView: View {
    
    var dessert: Dessert
    
    @State private var uiImage: UIImage?
    
    var body: some View {
        HStack {
            
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                    .frame(width: 60, height: 60)
            } else {
                ProgressView()
                    .frame(width: 60, height: 60)
            }
            
            Text(dessert.name)
                .bold()
                .foregroundColor(.black)
                .onAppear(perform: getImage)
            Spacer()
        }
       
    }
    private func getImage() {
        Task {
            let networkService = NetworkService()
            let image = try await networkService.getImage(with: dessert.imageURL)
            self.uiImage = image
        }
    }
}

struct DessertCellView_Previews: PreviewProvider {
    static var previews: some View {
        DessertCellView(dessert: Mock.dessert)
    }
}
