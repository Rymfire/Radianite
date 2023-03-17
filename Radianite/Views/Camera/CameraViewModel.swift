//
//  CameraViewModel.swift
//  Radianite
//
//  Created by Alexis Beaudoin on 06/03/2023.
//

import Foundation
import AVFoundation
import SwiftUI

class CameraViewModel: NSObject, ViewModel, AVCapturePhotoCaptureDelegate {
    @Published var isPictureTaken = false
    @Published var session = AVCaptureSession()
    @Published var alertPermissionDenied = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview: AVCaptureVideoPreviewLayer?

    init(preview: AVCaptureVideoPreviewLayer? = nil) {
        self.preview = preview
    }

    func checkAuthorization() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            /// Setting up session
            setUp()
            return
        case .notDetermined:
            /// Asking for permission
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status {
                    self.setUp()
                }
            }
            return
        case .denied:
            /// Permission denied
            self.alertPermissionDenied.toggle()
            return
        default:
            return
        }
    }

    func setUp() {
        do {
            self.session.beginConfiguration()

            guard let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) else { return }

            /// Setup input
            let input = try AVCaptureDeviceInput(device: device)
            if self.session.canAddInput(input) {
                self.session.addInput(input)
            }

            /// Setup output
            if self.session.canAddOutput(self.output) {
                self.session.addOutput(self.output)
            }

            self.session.commitConfiguration()

        } catch {
            print(error.localizedDescription)
        }
    }

    func takePicture() {
        DispatchQueue.global(qos: .background).async {
            self.output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
            self.session.stopRunning()

            DispatchQueue.main.async {
                withAnimation { self.isPictureTaken.toggle() }
            }
        }
    }

    func reTakePicture() {
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
            DispatchQueue.main.async {
                withAnimation { self.isPictureTaken.toggle() }
            }
        }
    }

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if error != nil { return }

        print("[LOG] Photo taken.")
    }
}


// TODO: Continue at https://youtu.be/8hvaniprctk?t=680
