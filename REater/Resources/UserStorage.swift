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
            UserModel(userName: "admin", password: "123", name: "Boris", surName: "Sobolev", avatar: "admin", location: "Moscow", favPlaces: [], friends: []),
            UserModel(userName: "user1", password: "123", name: "Andrei", surName: "Pashkevich", avatar: "andrej", location: "Moscow", favPlaces: [], friends: []),
            UserModel(userName: "user2", password: "123", name: "Kirill", surName: "Rybakov", avatar: "nikita", location: "Moscow", favPlaces: [], friends: []),
            UserModel(userName: "user3", password: "123", name: "Artem", surName: "Lamzov", avatar: "artem", location: "Moscow", favPlaces: [], friends: []),]
}
}
