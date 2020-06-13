//
//  DetailViewController.swift
//  Moallem
//
//  Created by Ahmed on 6/12/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class DetailViewController: UIViewController {
    
    var player: AVPlayer!
    var playerLayer: AVPlayerLayer!
    var video: Video!
    var isVideoPlaying = false {
        didSet {
            if isVideoPlaying {
                player.play()
                mainView.playButton.setImage(UIImage(systemName: "pause"), for: .normal)
            } else {
                player.pause()
                mainView.playButton.setImage(UIImage(systemName: "play"), for: .normal)
            }
        }
    }
    
    lazy var mainView: DetailView = {
        let view = DetailView(delegate: self)
        return view
    }()
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .landscape
        } else {
            return .all
        }
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = AVPlayer(url: video.url)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resize

        mainView.videoView.layer.addSublayer(playerLayer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnd), name:
        NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        playerLayer.frame = mainView.videoView.bounds
    }
    
    @objc func videoDidEnd(notification: NSNotification) {
        player.seek(to: CMTime.zero)
        isVideoPlaying = false
    }
    
    deinit {
       NotificationCenter.default.removeObserver(self)
    }
}

extension DetailViewController: DetailViewDelegate {
    
    func playButtonTapped() {
        isVideoPlaying.toggle()
    }
    
    func playerControllerButtonTapped() {
        isVideoPlaying = false
        let playerVC = AVPlayerViewController()
        playerVC.player = AVPlayer(url: video.url)
        playerVC.modalPresentationStyle = .fullScreen
        self.present(playerVC, animated: true, completion: nil)
    }
}
