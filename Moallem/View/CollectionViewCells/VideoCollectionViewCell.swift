//
//  VideoCollectionViewCell.swift
//  Moallem
//
//  Created by Ahmed on 6/12/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class VideoCollectionViewCell: UICollectionViewCell {
    
    static let id = "VideoCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.contentMode = .scaleToFill
        return imgv
    }()
    
    private lazy var overlyView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3035905394)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var playImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.translatesAutoresizingMaskIntoConstraints = false
        imgv.contentMode = .scaleToFill
        imgv.image = #imageLiteral(resourceName: "play")
        return imgv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Video){
        imageView.image = UIImage(named: model.imageName)
    }
    
    private func setImageViewConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -8),
        ])
    }
    
    private func setOverLayConstraints() {
        NSLayoutConstraint.activate([
            overlyView.topAnchor.constraint(equalTo: imageView.topAnchor),
            overlyView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            overlyView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            overlyView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
        ])
    }
    
    private func setPlayImageView(){
        NSLayoutConstraint.activate([
            playImageView.centerXAnchor.constraint(equalTo: overlyView.centerXAnchor),
            playImageView.centerYAnchor.constraint(equalTo: overlyView.centerYAnchor)
        ])
    }
    
    
    private func layoutUI(){
        addSubview(imageView)
        imageView.addSubview(overlyView)
        overlyView.addSubview(playImageView)
        
        setImageViewConstraints()
        setOverLayConstraints()
        setPlayImageView()
    }
}
