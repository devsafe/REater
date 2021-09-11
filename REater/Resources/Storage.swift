//
//  Storage.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import Foundation

class Storage {
    static var allUsers = UserStorage.init().allUsers
    static var allPlaces = PlaceStorage.init().allPlaces
    static var history = HistoryStorage.init().history
}
