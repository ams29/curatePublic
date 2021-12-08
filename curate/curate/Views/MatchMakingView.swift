//
//  MatchMakingView.swift
//  curate
//
//  Created by Yash Wani on 12/7/21.
//

import SwiftUI
import GameKitUI

struct MatchMakingView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel = MatchMakingViewModel()

    var body: some View {
        ZStack {
            Color.teal.ignoresSafeArea()
            VStack() {
                Text(self.viewModel.currentState)
                    .font(.body)
                    .padding(8)
                Button() {
                    self.viewModel.showMatchMakerModal()
                } label: {
                    Text("Curate")
                }
                .buttonStyle(ButtonStyle1())
            }
        }
        .onAppear() {
            self.viewModel.load()
        }
        .sheet(isPresented: self.$viewModel.showModal) {
            GKMatchmakerView(
                minPlayers: 2,
                maxPlayers: 10,
                inviteMessage: "Join me for a match of Curate!"
            ) {
                self.viewModel.showModal = false
                self.viewModel.currentState = "Player Canceled"
            } failed: { (error) in
                self.viewModel.showModal = false
                self.viewModel.currentState = "Match Making Failed"
                self.viewModel.showAlert(title: "Match Making Failed", message: error.localizedDescription)
            } started: { (match) in
                self.viewModel.showModal = false
            }
        }
        .alert(isPresented: self.$viewModel.showAlert) {
            Alert(title: Text(self.viewModel.alertTitle),
                  message: Text(self.viewModel.alertMessage),
                  dismissButton: .default(Text("Ok")))
        }
    }
}

struct MatchMakingView_Previews: PreviewProvider {
    static var previews: some View {
        MatchMakingView()
    }
}
