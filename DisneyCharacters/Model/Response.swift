//
//  Response.swift
//  DogFacts
//
//  Created by Amit Gupta on 14/12/24.
//

import Foundation
/* To Capture Disney characters using this data model. */
struct DisneyResponse : Codable {
    let data : [DisneyCharacter]?
}

struct DisneyCharacter : Codable {
    let _id : Int?
    let name : String?
    let imageUrl : String?
    let createdAt : String?
    let films : [String]?
    let tvShows : [String]?
    
enum CodingKeys: String, CodingKey {
        
    case _id = "_id"
    case name = "name"
    case imageUrl = "imageUrl"
    case createdAt = "createdAt"
    case films = "films"
    case tvShows = "tvShows"
}

    init(_id: Int?, name: String?, imageUrl: String?, createdAt: String?, films: [String]?, tvShows: [String]?) {
        self._id = _id
        self.name = name
        self.imageUrl = imageUrl
        self.createdAt = createdAt
        self.films = films
        self.tvShows = tvShows
    }
    
init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    _id = try values.decodeIfPresent(Int.self, forKey: ._id)
    name = try values.decodeIfPresent(String.self, forKey: .name)
    imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
    createdAt = try values.decodeIfPresent(String.self, forKey: .createdAt)
    films = try values.decodeIfPresent([String].self, forKey: .films)
    tvShows = try values.decodeIfPresent([String].self, forKey: .tvShows)
    }
}
