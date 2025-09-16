//
//  CollectionVC.swift
//  smiski tracker
//
//  Created by Shanaz Yeo on 5/9/25.
//

import UIKit

class CollectionVC: UIViewController {
    enum Section {
        case main
    }
    
    var categories: [Category]!
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Category>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViewController()
        configureCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        categories = DataStore.shared.getCategories()
        configureDataSource()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createTwoColumnFlowLayout(in: view))
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseID)
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Category>(collectionView: collectionView) { collectionView, indexPath, category in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseID, for: indexPath) as! CategoryCell
            print(category)
            cell.set(category: category)
            return cell
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Category>()
        snapshot.appendSections([.main])
        snapshot.appendItems(categories)
        dataSource.apply(snapshot, animatingDifferences: false)
    }

}
