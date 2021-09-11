//
//  PlaceStorage.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import Foundation

class PlaceStorage {
    
    let allPlaces: [PlaceModel]
    
    init() {
        
        allPlaces = [
            PlaceModel(name: "KFC", type: "FastFood", logo: "kfc", location: "Moscow"),
            PlaceModel(name: "Burger King", type: "FastFood", logo: "bk", location: "Moscow"),
            PlaceModel(name: "Tanuki", type: "FastFood", logo: "tanuki", location: "Moscow"),
            PlaceModel(name: "Laki King", type: "FastFood", logo: "laki", location: "Moscow"),
        ]
    }
}
