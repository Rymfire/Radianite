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

        let preview = AVCaptureVideoPreviewLayer(session: cameraVM.session)
        preview.frame = view.frame

        preview.videoGravity = .resizeAspectFill
        view.layer.addSublayer(preview)

        Task.detached(priority: .background) {
            await cameraVM.session.startRunning()
        }

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {

    }
}
