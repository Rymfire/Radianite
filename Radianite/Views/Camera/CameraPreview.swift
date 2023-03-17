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
        let view = UIView(frame: UIScreen.main.bounds)

        cameraVM.preview = AVCaptureVideoPreviewLayer(session: cameraVM.session)
        cameraVM.preview?.frame = view.frame

        cameraVM.preview?.videoGravity = .resizeAspectFill
        if let preview = cameraVM.preview { view.layer.addSublayer(preview) }

        cameraVM.session.startRunning()

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {

    }
}
