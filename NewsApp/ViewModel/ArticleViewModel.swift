//
//  ArticleViewModel.swift
//  NewsApp
//
//  Created by 逸唐陳 on 2021/9/26.
//

import Moya
import RxSwift
import RxCocoa
import RealmSwift

class ArticleViewModel {
    
    private let articleListProvider: MoyaProvider<ArticleListService>
    public let articles = PublishSubject<[Article]>()
    private let bag = DisposeBag()
    var notificationToken: NotificationToken? = nil
    
    init(articleListProvider: MoyaProvider<ArticleListService>) {
        self.articleListProvider = articleListProvider
        let realm = try! Realm()
        let objects = realm.objects(Article.self)
        notificationToken = objects.observe { changes in
            switch changes {
            case .initial:
                print("initial load")
                self.getData()
            case .update(_, _, _, _):
                print("update")
                self.getData()
            case .error(let error):
                fatalError("\(error)")
            }
        }
    }
    
    deinit {
        self.notificationToken?.invalidate()
    }
    
    public func fectchData() {
        articleListProvider.rx.request(.newsList)
            .map([Article].self, atKeyPath: "articles")
            .subscribe { result in
                switch result {
                case .success(let articles):
                    StorageManager.shared.saveData(articles: articles)
                case .failure(let error):
                    print(error)
                }
            }.disposed(by: bag)
    }
    
    private func getData() {
        let localData = StorageManager.shared.getLocalData()
        articles.onNext(localData)
    }
    
}
