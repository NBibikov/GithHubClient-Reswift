//
//  State.swift
//  ReSwift_Example
//
//  Created by Nick Bibikov on 2/2/18.
//  Copyright © 2018 nbibikov. All rights reserved.
//

import ReSwift
import ReSwiftRouter


struct State: StateType, HasNavigationState {
    var navigationState: NavigationState
    var authenticationState: AuthenticationState
    var bookmarks: [Bookmark]
}

typealias Bookmark = (route: [RouteElementIdentifier], routeSpecificData: Any?)
