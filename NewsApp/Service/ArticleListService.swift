//
//  NewsListService.swift
//  NewsApp
//
//  Created by 逸唐陳 on 2021/9/25.
//

import Moya

public enum ArticleListService {
    case newsList
}

extension ArticleListService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://newsapi.org")!
    }
    
    public var path: String {
        return "/v2/top-headlines"
    }
    
    public var method: Method {
        return .get
    }
    
    public var task: Task {
        let parameters = ["country": "us", "apiKey": "4fd183723e4c44b39dd5f53d0925f16a"]
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json; charset=utf-8"]
    }

}
