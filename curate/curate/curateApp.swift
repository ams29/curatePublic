//
//  curateApp.swift
//  curate
//
//  Created by Yash Wani on 12/4/21.
//

import SwiftUI
import GameKit
import GameKitUI
 
@main
struct curateApp: App {
    
    @ObservedObject var viewModel = GKMatchMakerAppModel()

    public var body: some Scene {
        WindowGroup {
            ZStack {
                Color.teal.ignoresSafeArea()
                MatchMakingView()
                    .alert(isPresented: self.$viewModel.showAlert) {
                        Alert(title: Text(self.viewModel.alertTitle),
                              message: Text(self.viewModel.alertMessage),
                              dismissButton: .default(Text("Ok")))
                    }
                if self.viewModel.showAuthentication {
                    GKAuthenticationView { (error) in
                        self.viewModel.showAlert(title: "Authentication Failed", message: error.localizedDescription)
                    } authenticated: { (player) in
                        self.viewModel.showAuthentication = false
                    }
                } else if self.viewModel.showInvite {
                    GKInviteView(
                        invite: self.viewModel.invite.gkInvite!
                    ) {
                    } failed: { (error) in
                        self.viewModel.showAlert(title: "Invitation Failed", message: error.localizedDescription)
                    } started: { (gkMatch) in
                        self.viewModel.showInvite = false
                        self.viewModel.gkMatch = gkMatch
                    }
                } else if self.viewModel.showMatch,
                          let gkMatch = self.viewModel.gkMatch {
                    MatchView(gkMatch)
                }
            }
        }
    }
}
