//
//  AuthenticationReducer.swift
//  ReSwift_Example
//
//  Created by Nick Bibikov on 2/6/18.
//  Copyright © 2018 nbibikov. All rights reserved.
//

import Foundation
import ReSwift
import OctoKit

func authenticationReducer(state: AuthenticationState?, action: Action) -> AuthenticationState {
    var state = state ?? initialAuthenticationState()
}


func initialAuthenticationState() -> AuthenticationState {
    let config = OAuthConfiguration(
        token: gitHubClientId,
        secret: gitHubClientSecret,
        scopes: ["repo", "read: org"]
    )
    
    if let authData = Au
}
