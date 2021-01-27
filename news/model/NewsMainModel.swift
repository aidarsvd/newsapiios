//
//  NewsMainModel.swift
//  news
//
//  Created by Айдар Чакиев on 27/1/21.
//

import Foundation
import ObjectMapper
import UIKit

class BaseResponse<T: Mappable>: Mappable {
   
    var status : String?
    var totalResults: Int?
    var articles: [T]?
    
    required init?(map: Map)
    {
        
    }
    
    func mapping(map: Map) {
        if let _ = try? map.value("articles") as [Any] {
            articles <- map["articles"]
            
        } else {
            articles <- map["articles"]
        }
        status <- map["status"]
    }
}

class BaseModel: Mappable {
    
    required init?(map: Map)
    {
    }
    
    func mapping(map: Map)
    {
    }
}

class NewsMainModel: BaseModel{
    var source: NewsSourceModel?
    var author : String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
    override func mapping(map: Map) {
        source <- map["source"]
        author <- map["author"]
        title <- map["title"]
        description <- map["description"]
        url <- map["url"]
        urlToImage <- map["urlToImage"]
        publishedAt <- map["publishedAt"]
    }
}

class NewsSourceModel: BaseModel{
    var id: String?
    var name: String?
}
