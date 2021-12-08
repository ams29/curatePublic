//
//  ContentView.swift
//  curate
//
//  Created by Yash Wani on 12/4/21.
//

import SwiftUI
import GameKit

struct ContentView: View {
    
    @State var isAuth: Bool = GKLocalPlayer.local.isAuthenticated
        
    var body: some View {
        NavigationView {
            ZStack {
                Color.teal.edgesIgnoringSafeArea(.all)
                if isAuth {
                    NavigationLink(destination: MatchMakingView()) {
                        Text("Curate")
                    }.buttonStyle(ButtonStyle1())
                } else {
                    NavigationLink(destination: AuthenticationView()) {
                        Text("Curate")
                    }.buttonStyle(ButtonStyle1())

                }
            }
        }
    }
} 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
