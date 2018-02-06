//
//  AppDelegate.swift
//  ReSwift_Example
//
//  Created by Nick Bibikov on 2/2/18.
//  Copyright © 2018 nbibikov. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter


var store = Store<State>(reducer: appReducer, state: nil)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var router: Router<State>!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UIViewController()
        
        let rootRoutable = RootRoutable(window: window!)
        router = Router(store: store, rootRoutable: rootRoutable) { state in
            state.select { $0.navigationState }
        }
        
        if case .loggedIn(_) = store.state.authenticationState.loggedInState {
            store.dispatch(ReSwiftRouter.SetRouteAction([mainViewRoute]))
        } else {
            store.dispatch(ReSwiftRouter.SetRouteAction([loginRoute]))
        }
        window?.makeKeyAndVisible()
        
        return true
    }
    
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any]) -> Bool {
        store.dispatch(handleOpenURL(url: url))
        
        return false
    }
}

