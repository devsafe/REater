//
//  UserStorage.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import Foundation

class UserStorage {
    
    let allUsers: [UserModel]
    
    init() {
        
        allUsers = [
            UserModel(userName: "admin", password: "123", name: "Boris", surName: "Sobolev", avatar: "boris", location: "Moscow", favPlaces: [], friends: [])]
}
}
