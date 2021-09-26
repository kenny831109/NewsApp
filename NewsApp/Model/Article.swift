//
//  Article.swift
//  NewsApp
//
//  Created by 逸唐陳 on 2021/9/25.
//

import Foundation
import RealmSwift

class Article: Object, Decodable {
    @objc dynamic var author: String? = ""
    @objc dynamic var title: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var urlToImage: String? = ""
    @objc dynamic var publishedAt: String = ""
    @objc dynamic var content: String? = ""
    
    override static func primaryKey() -> String? {
        return "title"
    }
}
