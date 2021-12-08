//
//  AuthenticationView.swift
//  curate
//
//  Created by Yash Wani on 12/7/21.
//

import SwiftUI
import GameKitUI

struct AuthenticationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = AuthenticationViewModel()

    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            VStack() {
                Text(self.viewModel.currentState)
                    .font(.body)
                    .padding(8)
                if self.viewModel.isAuthenticated {
                    NavigationLink(destination: MatchMakingView()) {
                        Text("Curate")
                    }.buttonStyle(ButtonStyle1())
                }
                   else {
                    Button() {
                        self.viewModel.showAuthenticationModal()
                    } label: {
                        Text("Login to GameCenter")
                    }.buttonStyle(ButtonStyle1())
                }
            }
        }
        .onAppear() {
            self.viewModel.load()
        }
        .sheet(isPresented: self.$viewModel.showModal) {
            GKAuthenticationView { (error) in
                self.viewModel.showModal = false
                self.viewModel.showAlert(title: "Authentication Failed", message: error.localizedDescription)
                self.viewModel.currentState = error.localizedDescription
            } authenticated: { (player) in
                self.viewModel.showModal = false
                self.viewModel.player = player
                self.viewModel.currentState = "Authenticated"
            }
            .frame(width: 640, height: 480)
        }
        .alert(isPresented: self.$viewModel.showAlert) {
            Alert(title: Text(self.viewModel.alertTitle),
                  message: Text(self.viewModel.alertMessage),
                  dismissButton: .default(Text("Ok")))
        }
    }}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView()
    }
}
