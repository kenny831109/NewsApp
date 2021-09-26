//
//  StorageManager.swift
//  NewsApp
//
//  Created by 逸唐陳 on 2021/9/26.
//

import RealmSwift

class StorageManager {
    
    public static let shared = StorageManager()
    private init() {}
    
    public func saveData(articles: [Article]) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(articles, update: .modified)
        }
    }
    
    public func getLocalData() -> [Article] {
        let realm = try! Realm()
        let realmObjects = realm.objects(Article.self)
        return Array(realmObjects)
    }
    
}
