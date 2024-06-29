//
//  RemoteImage.swift
//  SwiftUI-Appetizer
//
//  Created by Muhammad Radian Rasyid on 28/06/24.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String){
        NetworkManagerService.shared.downloadImage(fromURLString: urlString){ uiImage in
            guard let uiImage = uiImage else {return}
            
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View{
        image?.resizable() ?? Image(systemName: "fork.knife.circle.fill").resizable()
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{
                imageLoader.load(fromURLString: urlString)
            }
    }
}
