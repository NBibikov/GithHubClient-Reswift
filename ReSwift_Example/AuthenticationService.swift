//
//  AuthenticationService.swift
//  ReSwift_Example
//
//  Created by Nick Bibikov on 2/6/18.
//  Copyright © 2018 nbibikov. All rights reserved.
//

import Foundation
import OctoKit
import SAMKeychain


class AuthenticationService {
    
    func authenticationData() -> TokenConfiguration? {
        if let data = SAMKeychain.passwordData(forService: "GitHubAuth", account: "TokenConfiguration") {
            return TokenConfiguration(data: data)
        } else {
            return nil
        }
    }
    
    func saveAuthenticationData(_ token: TokenConfiguration) {
        let data = token.toData
    }
}


extension TokenConfiguration {
    
    init(data: Data) {
        let json: [String: AnyObject] = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
        
        self.apiEndpoint = json["endpoint"] as! String
        self.accessToken = { if case let s = json["accesstoken"] as? String, s != "null" { return s } else { return nil} }()
    
    }
}
