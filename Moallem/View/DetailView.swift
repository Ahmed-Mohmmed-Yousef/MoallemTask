//
//  DetailView.swift
//  Moallem
//
//  Created by Ahmed on 6/12/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit

@objc protocol DetailViewDelegate: class {
    var title: String? { get set }
    var navigationController: UINavigationController? { get }
    var navigationItem: UINavigationItem { get }
    @objc func playButtonTapped()
    @objc func playerControllerButtonTapped()
}

class DetailView: UIView {
    
    lazy var videoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    
    lazy var playButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "play"), for: .normal)
        btn.tintColor =  ThemeData.baseColor
        btn.addTarget(delegate, action: #selector(delegate.playButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var playerControllerButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "tv"), for: .normal)
        btn.tintColor =  ThemeData.baseColor
        btn.addTarget(delegate, action: #selector(delegate.playerControllerButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private weak var delegate: DetailViewDelegate!
    
    init(delegate: DetailViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        backgroundColor = .white
        setupNavController()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavController(){
        delegate.title = "Video Player"
        delegate.navigationItem.largeTitleDisplayMode = .never
        delegate.navigationController?.navigationBar.tintColor = ThemeData.baseColor
    }
    
    private func addViews(){
        addSubview(videoView)
        addSubview(playButton)
        addSubview(playerControllerButton)
    }
    
    private func setVideoViewConstraint(){
        NSLayoutConstraint.activate([
            videoView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            videoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            videoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            videoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            videoView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 9/16)
        ])
    }
    
    private func setPlayButtonConstraints() {
        NSLayoutConstraint.activate([
            playButton.leadingAnchor.constraint(equalTo: videoView.leadingAnchor, constant: 8),
            playButton.bottomAnchor.constraint(equalTo: videoView.bottomAnchor, constant: -8),
            playButton.heightAnchor.constraint(equalToConstant: 25),
            playButton.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    private func setPlayerControllerButtonConstraints() {
        NSLayoutConstraint.activate([
            playerControllerButton.leadingAnchor.constraint(equalTo: playButton.trailingAnchor, constant: 8),
            playerControllerButton.bottomAnchor.constraint(equalTo: videoView.bottomAnchor, constant: -8),
            playerControllerButton.heightAnchor.constraint(equalToConstant: 25),
            playerControllerButton.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    
    private func layoutUI(){
        addViews()
        setVideoViewConstraint()
        setPlayButtonConstraints()
        setPlayerControllerButtonConstraints()
    }
}
