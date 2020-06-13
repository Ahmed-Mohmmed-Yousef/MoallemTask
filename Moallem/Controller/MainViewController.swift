//
//  ViewController.swift
//  Moallem
//
//  Created by Ahmed on 6/12/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var mainView: MainView = {
        let view = MainView(delegate: self)
        return view
    }()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}


extension MainViewController: MainViewDelegate {
    
    func menuButtonTapped() {
        print("Menu Bar Button Action")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.subjectCollectionView {
            return database.count
        } else {
            return videoDB.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.subjectCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubjectCollectionViewCell.id, for: indexPath) as! SubjectCollectionViewCell
            cell.setupCell(model: database[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCollectionViewCell.id, for: indexPath) as! VideoCollectionViewCell
            cell.setupCell(model: videoDB[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView.subjectCollectionView {
            return CGSize(width: 100, height: 150)
        }
        return CGSize(width: 175, height: 126)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.videoCollectionView {
            let vc = DetailViewController()
            let selectedVideo = videoDB[indexPath.row]
            vc.modalPresentationStyle = .fullScreen
            vc.video = selectedVideo
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
