//
//  MainView.swift
//  Moallem
//
//  Created by Ahmed on 6/12/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

@objc protocol MainViewDelegate: class, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var title: String? { get set }
    var navigationController: UINavigationController? { get }
    var navigationItem: UINavigationItem { get }
    @objc func menuButtonTapped()
}

class MainView: UIView {
    private lazy var scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var subjectLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subjects"
        lbl.font = UIFont(name: "Helvetica-Bold", size: 15.0)
        lbl.textColor = ThemeData.baseColor
        return lbl
    }()
    
    lazy var subjectCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout:layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private lazy var welcomLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 2
        lbl.text = "Welcome Back! \nContinue learning?"
        lbl.font = UIFont(name: "Helvetica-Bold", size: 15.0)
        lbl.textColor = ThemeData.baseColor
        return lbl
    }()
    
    lazy var videoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private weak var delegate: MainViewDelegate!
    
    init(delegate: MainViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setupNavController()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavController(){
        delegate.title = "Moallem"
        delegate.navigationController?.navigationBar.prefersLargeTitles = true
        delegate.navigationController?.navigationBar.isTranslucent = true
        delegate.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : ThemeData.baseColor
        ]
        let barButton = UIBarButtonItem(image: #imageLiteral(resourceName: "menu2"), style: .plain, target: delegate, action: #selector(delegate.menuButtonTapped))
        barButton.tintColor = ThemeData.baseColor
        delegate.navigationItem.rightBarButtonItem = barButton
        collectionViewsConfig()
            
    }
    
    private func collectionViewsConfig(){
        subjectCollectionView.delegate = delegate
        subjectCollectionView.dataSource = delegate
        subjectCollectionView.register(SubjectCollectionViewCell.self, forCellWithReuseIdentifier: SubjectCollectionViewCell.id)
        
        videoCollectionView.delegate = delegate
        videoCollectionView.dataSource = delegate
        videoCollectionView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: VideoCollectionViewCell.id)
    }
    
    private func addViews(){
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(subjectLbl)
        containerView.addSubview(subjectCollectionView)
        containerView.addSubview(welcomLbl)
        containerView.addSubview(videoCollectionView)
    }
    
    private func setScrollViewConstraints(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setContainerViewConstraints(){
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            containerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func setSubjectLblConstraints() {
        NSLayoutConstraint.activate([
            subjectLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            subjectLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16)
        ])
    }
    
    private func setSubjectCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            subjectCollectionView.topAnchor.constraint(equalTo: subjectLbl.bottomAnchor, constant: 8),
            subjectCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            subjectCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            subjectCollectionView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setWellcomLblConstraints(){
        NSLayoutConstraint.activate([
            welcomLbl.topAnchor.constraint(equalTo: subjectCollectionView.bottomAnchor, constant: 64),
            welcomLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
        ])
    }
    
    private func setVideoCollectionViewConstraints(){
        NSLayoutConstraint.activate([
            videoCollectionView.topAnchor.constraint(equalTo: welcomLbl.bottomAnchor, constant: 32),
            videoCollectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            videoCollectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            videoCollectionView.heightAnchor.constraint(equalToConstant: 126),
            videoCollectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8)
        ])
    }
    
    private func layoutUI(){
        addViews()
        setScrollViewConstraints()
        setContainerViewConstraints()
        setSubjectLblConstraints()
        setSubjectCollectionViewConstraints()
        setWellcomLblConstraints()
        setVideoCollectionViewConstraints()
    }
}
