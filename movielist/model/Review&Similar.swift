//
//  Review&Similar.swift
//  movielist
//
//  Created by Ayana on 14/05/20.
//  Copyright © 2020 Ayana. All rights reserved.
//

import Foundation
struct Review
{
    var  title: String = ""

    var poster_path : String = ""
    var  author: String = ""
    var id : String = ""
    var content: String = ""
    init()
    {
        
    }
    init(json : JSON)
    {
        title = json["title"].stringValue
        poster_path = json["poster_path"].stringValue
        author = json["author"].stringValue
        content = json["content"].stringValue
        id = json["id"].stringValue
        
    }
}
