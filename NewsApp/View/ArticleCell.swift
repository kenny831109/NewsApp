//
//  ArticleCell.swift
//  NewsApp
//
//  Created by 逸唐陳 on 2021/9/26.
//

import UIKit
import Kingfisher

class ArticleCell: UITableViewCell {
    
    let thumbnail: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    
    var article: Article! {
        didSet {
            self.title.text = article.title
            self.thumbnail.kf.setImage(with: URL(string: article.urlToImage ?? ""))
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        contentView.addSubview(thumbnail)
        thumbnail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        thumbnail.widthAnchor.constraint(equalToConstant: 70).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: 70).isActive = true
        thumbnail.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contentView.addSubview(title)
        title.leadingAnchor.constraint(equalTo: thumbnail.trailingAnchor, constant: 15).isActive = true
        title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        title.heightAnchor.constraint(lessThanOrEqualToConstant: 70).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
