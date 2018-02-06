//
//  AppReducer.swift
//  ReSwift_Example
//
//  Created by Nick Bibikov on 2/6/18.
//  Copyright © 2018 nbibikov. All rights reserved.
//

import ReSwift
import ReSwiftRouter

func appReducer(action: Action, state: State?) -> State {
    return State(
        navigationState: NavigationReducer.handleAction(action, state: state?.navigationState),
        authenticationState: auth
    )
}
