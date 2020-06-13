//
//  subjectCollectionViewCell.swift
//  Moallem
//
//  Created by Ahmed on 6/12/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

class SubjectCollectionViewCell: UICollectionViewCell {
    static var id = "subjectCollectionViewCell"
    
    private lazy var titleLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Subjects"
        lbl.font = UIFont(name: "Helvetica-Neue", size: 14.0)
        lbl.textColor = ThemeData.baseColor
        return lbl
    }()
    
    private lazy var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    private lazy var imgViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = ThemeData.baseColor.cgColor
        view.layer.shadowRadius = 10
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.3
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
     }()
     
     var contentsLayer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
     }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: Subject){
        imageView.image = UIImage(named: "\(model.imageName)")
        titleLbl.text = model.title
    }
    
    private func setImageViewContainer(){
        NSLayoutConstraint.activate([
            imgViewContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            imgViewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            imgViewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            imgViewContainer.heightAnchor.constraint(equalToConstant: 85),
        ])
        
        
        NSLayoutConstraint.activate([
            // Constrains your contentsLayer to the mainView
            contentsLayer.centerYAnchor.constraint(equalTo: imgViewContainer.centerYAnchor),
            contentsLayer.centerXAnchor.constraint(equalTo: imgViewContainer.centerXAnchor),
            contentsLayer.heightAnchor.constraint(equalTo: imgViewContainer.heightAnchor),
            contentsLayer.widthAnchor.constraint(equalTo: imgViewContainer.widthAnchor)
        ])
    }
    
    private func setImageView(){
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: contentsLayer.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentsLayer.centerYAnchor),
        ])
    }
    
    private func setTitle(){
        NSLayoutConstraint.activate([
            titleLbl.topAnchor.constraint(equalTo: imgViewContainer.bottomAnchor, constant: 16),
            titleLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLbl.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    private func layoutUI(){
        addSubview(imgViewContainer)
        imgViewContainer.addSubview(contentsLayer)
        contentsLayer.addSubview(imageView)
        addSubview(titleLbl)
        setImageViewContainer()
        setImageView()
        setTitle()
    }
    
    
}


