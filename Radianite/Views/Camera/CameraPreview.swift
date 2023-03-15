//
//  CameraPreview.swift
//  Radianite
//
//  Created by Alexis Beaudoin on 14/03/2023.
//

import SwiftUI
import UIKit
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    @ObservedObject var cameraVM: CameraViewModel

    func makeUIView(context: Context) -> UIView {
        let current = UIView(frame: UIScreen.main.bounds)

        cameraVM.capturePreview = AVCaptureVideoPreviewLayer(session: cameraVM.session)
//        cameraVM.preview.frame = view.bounds // from GL - ask Florian
        cameraVM.capturePreview.frame = current.frame

        cameraVM.capturePreview?.videoGravity = .resizeAspectFill
        if let preview = cameraVM.capturePreview { current.layer.addSublayer(preview) }
        return current
    }

    func updateUIView(_ uiView: UIView, context: Context) {

    }
}
