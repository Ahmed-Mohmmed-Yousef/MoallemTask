//
//  Video.swift
//  Moallem
//
//  Created by Ahmed on 6/12/20.
//  Copyright © 2020 Ahmed,ORG. All rights reserved.
//

import Foundation

struct Video {
    let imageName: String
    let url: URL
}


let videoDB: [Video] = [
    Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "sampleVideo", ofType: "mp4")!)),
    Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "sampleVideo", ofType: "mp4")!)),
    Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "sampleVideo", ofType: "mp4")!)),
    Video(imageName: "overlay", url: URL(fileURLWithPath: Bundle.main.path(forResource: "sampleVideo", ofType: "mp4")!))
    
]
