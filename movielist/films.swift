//
//  films.swift
//  movielist
//
//  Created by Ayana on 08/05/20.
//  Copyright © 2020 Ayana. All rights reserved.
//

import Foundation
struct Films
{
    var  title: String = ""
    var  release_dat: String = ""
    var poster_path : String = ""
    var name : String = ""
   var id : String = ""
    var overview = ""
    var credit_id = ""
    var cast_id = ""
    var profile_path : String = ""
    init()
    {
        
    }
    init(json : JSON)
    {
        title = json["title"].stringValue
        release_dat = json["release_dat"].stringValue
        poster_path = json["poster_path"].stringValue
        id = json["id"].stringValue
        overview = json["overview"].stringValue
        credit_id = json["cresit_id"].stringValue
        cast_id = json["cast_id"].stringValue
        profile_path = json["profile_path"].stringValue
        name = json["name"].stringValue
    }
}
