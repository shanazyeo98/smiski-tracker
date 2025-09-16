//
//  CategoryCell.swift
//  smiski tracker
//
//  Created by Shanaz Yeo on 16/9/25.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    static let reuseID = "CategoryCell"
    
    let categoryTitle = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    func set(category: Category) {
        categoryTitle.text = category.name
    }
    
    private func configure() {
        contentView.backgroundColor = .systemGreen
        addSubview(categoryTitle)
        
        let padding: CGFloat = 4
        
        NSLayoutConstraint.activate([
            categoryTitle.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            categoryTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            categoryTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            categoryTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding)
        ])
    }
}
