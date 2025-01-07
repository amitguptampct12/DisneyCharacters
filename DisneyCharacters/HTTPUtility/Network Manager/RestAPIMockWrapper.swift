//
//  RestAPIMockWrapper.swift
//  DisneyCharacters
//
//  Created by Amit Gupta on 06/01/25.
//

import Foundation
/* Mock API manager */
struct RestAPIMockWrapper: HTTPService {
    func getCharacters(rawUrl: String, completionHandler: @escaping (DisneyResponse?, NetworkError?) -> Void) {
        
        if let url = URL(string: rawUrl){
            /* BY-Pass Network call and return static mock data.*/
            let disneyCharacter = DisneyCharacter(_id: 10, name: "Kent", imageUrl: "https://static.wikia.nocookie.net/disney/images/d/d3/Vlcsnap-2015-05-06-23h04m15s601.png", createdAt: "2021-04-12T01:31:30.547Z", films: ["Hercules (film)"], tvShows: ["Hercules (TV series)"])
            let disneyResponse = DisneyResponse(data: [disneyCharacter])
            completionHandler(disneyResponse,nil)
        }else{
            completionHandler(nil, .badURL)
        }
    }
}
