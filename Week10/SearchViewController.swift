//
//  SearchViewController.swift
//  Week10
//
//  Created by 마르 on 2023/09/21.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController {
    
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    var dataSource: UICollectionViewDiffableDataSource<Int, Int>!
    
    
    let list = Array(0...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureDataSource()
        
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    // static -> 타입 function. 인스턴스가 아님. 영구적으로 남아있음
    static func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 50, height: 50)
        layout.scrollDirection = .vertical
        return layout
    }
    
    func configureHierarchy() {
        view.addSubview(collectionView)
    }
    
    func configureLayout() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<SearchCollectionViewCell, Int> { cell, indexPath, itemIdentifier in
            cell.imageView.image = UIImage(systemName: "star")
            cell.label.text = "\(itemIdentifier)번"
        }
        
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems(list)
        dataSource.apply(snapshot)
    }
    
}

// ScrollView
/*
class SearchViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let imageView = UIImageView()
    let label = UILabel()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureHierarchy()
        configureLayout()
        configureContentView()
    }
    
    func configureHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
    
    }
    
    func configureLayout() {
        scrollView.backgroundColor = .lightGray
        scrollView.bounces = false //
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.backgroundColor = .white
        contentView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
        }
    }
 
 func scrollViewDidScroll(_ scrollView: UIScrollView) {
     print(scrollView.contentOffset)
     print(scrollView.contentOffset.y)
     
     if scrollView.contentOffset.y >= 50 {
         label.alpha = 0
     }
 }
    
    func configureContentView() {
        contentView.addSubview(imageView)
        contentView.addSubview(button)
        contentView.addSubview(label)
        
        imageView.backgroundColor = .orange
        button.backgroundColor = .magenta
        label.backgroundColor = .systemGreen
        
        imageView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(contentView).inset(10)
            make.height.equalTo(200)
        }
        button.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(contentView).inset(10)
            make.height.equalTo(80)
        }
        label.text = "안녕ddddfsfdfdff\nkkdkfd\nfdff\nfdfdff\nfdfdff\nfdfdff\nfdfdf\nf\nsfdafdgwefwcv 235325\n423dkfd안녕\nksfd\nsfdsfdsa\nd\nsfsf안녕\nk\ndsa\nfdgswrwe\n\n jjl\n\n\nnjhvh"
        label.numberOfLines = 0
        label.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView)
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.bottom.equalTo(button.snp.top).offset(-50)
        }
        
    }
}
*/

/*
class SearchViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        configureHierarchy()
        configureLayout()
        configureStackView()
    }
    
    func configureHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
    }
    
    func configureLayout() {
        scrollView.backgroundColor = .systemPink
        
        scrollView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(70)
        }
        
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.height.equalTo(scrollView)
        }
    }
    
    func configureStackView() {
        let label1 = UILabel()
        label1.backgroundColor = .systemGreen
        label1.text = "안녕하kkkkkknmknknknkn세요"
        label1.textColor = .white
        stackView.addArrangedSubview(label1)
        
        let label2 = UILabel()
        label2.text = "ㅎㅎㅇㅎㅇㅎㅇㅇㅇㅎㅇㅎㅇㅎㅇㅎㅇㅎㅇㅇㅎㅎㅎㅇㅇ"
        label2.textColor = .white
        stackView.addArrangedSubview(label2)
        
        let label3 = UILabel()
        label3.text = "ㅎㅇㅎㅇ"
        label3.textColor = .white
        stackView.addArrangedSubview(label3)
        
        let label4 = UILabel()
        label4.text = "안녕????????????????????????"
        label4.textColor = .white
        stackView.addArrangedSubview(label4)
        
        let label5 = UILabel()
        label5.text = "좋은아침"
        label5.textColor = .white
        stackView.addArrangedSubview(label5)
    }
}

*/
