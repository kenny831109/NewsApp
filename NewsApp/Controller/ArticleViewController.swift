//
//  ArticleViewController.swift
//  NewsApp
//
//  Created by 逸唐陳 on 2021/9/26.
//

import UIKit
import RxCocoa
import RxSwift
import Moya

class ArticleViewController: UIViewController {
    
    let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(ArticleCell.self, forCellReuseIdentifier: "cell")
        view.rowHeight = 100
        view.backgroundColor = .white
        return view
    }()
    
    private let disposeBag = DisposeBag()
    private var articleViewModel: ArticleViewModel!
    private let articleProvider = MoyaProvider<ArticleListService>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        articleViewModel = ArticleViewModel(articleListProvider: articleProvider)
        bindTableData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = "Exam"
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    private func bindTableData() {
        
        articleViewModel.articles
            .bind(to: tableView.rx.items(cellIdentifier: "cell",
                                         cellType: ArticleCell.self)
            ) { row, article, cell in
                cell.article = article
            }.disposed(by: disposeBag)
        
        Observable
            .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(Article.self))
            .bind { [weak self] indexPath, article in
                self?.tableView.deselectRow(at: indexPath, animated: true)
                print("Selected " + article.title + " at \(indexPath)")
            }.disposed(by: disposeBag)
        
        articleViewModel.fectchData()
    }
    
}
