//
//  EpisodeModel.swift
//  Characters
//
//  Created by Christo Kumar on 30/06/22.
//

import Foundation

struct EpisodeModel : Identifiable, Decodable, Hashable {
    static func == (lhs: EpisodeModel, rhs: EpisodeModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: Int?
    var name : String?
    var air_date : String?
    var episode : String?
    var characters : [String]?
    var url : String
    var created : String
    
    init() {
        id = 0
        name = "No episode was found"
        air_date = "N/A"
        episode = "N/A"
        characters = ["N/A"]
        url = "http"
        created = "once"
    }
}
