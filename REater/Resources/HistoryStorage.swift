//
//  HistoryStorage.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import Foundation

class HistoryStorage {
    
    let history: [HistoryModel]
    
    init() {
        
        history = [
            HistoryModel(date: Date().addingTimeInterval(343334), place: PlaceModel(name: "KFC", type: "34", logo: "kfc", location: "Moscow"), isGoing: true)
        ]
    }
}
