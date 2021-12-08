//
//  ImageTest.swift
//  curate
//
//  Created by Yash Wani on 12/7/21.
//

import SwiftUI


struct ImageTest: View {
    
    var imageURL: String
    
    
    
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()
                    .frame(maxWidth: 300, maxHeight: 300)
                
            case .failure(let error):
                Text(error.localizedDescription)
                
            case .empty:
                CardView()
                
            @unknown default:
                EmptyView()
            }
        } .onTapGesture {
            print(self.imageURL)
        }
    }
    
}

struct ImageTest_Previews: PreviewProvider {
    static var previews: some View {
        ImageTest(imageURL: "https://m.media-amazon.com/images/G/3/Shopbop/p/prod/products/vbear/vbear319051c3c8/vbear319051c3c8_1638477096350_2-0.jpg")
    }
}
