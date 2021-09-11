//
//  UserModel.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import Foundation

struct UserModel {
    var userName: String
    var password: String
    var name: String
    var surName: String
    var fullName: String {
        return name + " " + surName
    }
    var avatar: String
    var location: String
    var favPlaces: [PlaceModel]
    var friends: [UserModel]
}
