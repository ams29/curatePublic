//
//  CardView.swift
//  curate
//
//  Created by Yash Wani on 12/7/21.
//

import SwiftUI

struct CardView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image("shoes")
            Text("SwiftUI")
                .font(.title)
                .fontWeight(.bold)
            Text("Testing")
            Text("Testing2")
        }
        .foregroundColor(.white)
        .padding(.all)
        .background(LinearGradient(
                gradient: Gradient(stops: [
            .init(color: Color.blue, location: 0),
            .init(color: Color.red, location: 1)]),
                startPoint: UnitPoint(x: 0.5002249700310126,
                                      y: 3.0834293490377423e-7),
                endPoint: UnitPoint(x: -0.0016390833199537713, y: 0.977085239704672)))
        .cornerRadius(30)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
