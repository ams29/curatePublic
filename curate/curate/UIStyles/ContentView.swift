//
//  ContentView.swift
//  Shared
//
//  Created by Patron on 12/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(0 ..< 5) { item in
                            CardView()
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Testing3")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


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
        .frame(width: 252, height: 329)
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
