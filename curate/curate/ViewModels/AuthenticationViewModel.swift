//
//  AuthenticationViewModel.swift
//  curate
//
//  Created by Yash Wani on 12/7/21.
//

import Foundation
import Combine
import GameKit
import GameKitUI

class AuthenticationViewModel: ObservableObject {
    
    @Published public var showModal = false
    @Published public var showAlert = false
    @Published public var isAuthenticated = false
    @Published public var alertTitle: String = ""
    @Published public var alertMessage: String = ""
    @Published public var currentState: String = "Loading GameKit..."
    @Published public var player: GKPlayer? {
        didSet {
            self.isAuthenticated = self.player != nil
        }
    }
    
    public func load() {
        if self.isAuthenticated {
            return
        }
        self.showAuthenticationModal()
    }
    
    public func showAlert(title: String, message: String) {
        self.showAlert = true
        self.alertTitle = title
        self.alertMessage = message
    }
    
    public func showAuthenticationModal() {
        self.showModal = true
    }
}
