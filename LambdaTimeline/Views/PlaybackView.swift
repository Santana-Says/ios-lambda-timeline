//
//  PlaybackView.swift
//  LambdaTimeline
//
//  Created by Jeffrey Santana on 10/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import AVFoundation

class PlaybackView: UIView {
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var videoPlayerView: AVCaptureVideoPreviewLayer {
		let previewLayer = layer as! AVCaptureVideoPreviewLayer
//		previewLayer.videoGravity = .resizeAspectFill
        return previewLayer
    }
    
    var session: AVCaptureSession? {
        get { return videoPlayerView.session }
        set { videoPlayerView.session = newValue }
    }
}
