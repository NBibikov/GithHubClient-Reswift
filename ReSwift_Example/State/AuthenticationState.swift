//
//  AuthenticationState.swift
//  ReSwift_Example
//
//  Created by Nick Bibikov on 2/2/18.
//  Copyright © 2018 nbibikov. All rights reserved.
//

import Foundation


struct AuthenticationState {
    var oAuthURL: URL?
    var loggedInState: LoggedInState
}

enum LoggedInState {
    case notLoggedIn
    case loggedIn(TokenConfiguration)
}
