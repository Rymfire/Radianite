//
//  CameraView.swift
//  Radianite
//
//  Created by Alexis Beaudoin on 06/03/2023.
//

import SwiftUI

struct CameraView: View {
    @StateObject var cameraVM: CameraViewModel

    var body: some View {
        ZStack {
            // TODO: Camera ...
            CameraPreview(cameraVM: cameraVM)
                .ignoresSafeArea(.all, edges: .all)
            VStack {
                Spacer()
                if cameraVM.isPictureTaken {
                    HStack {
                        Spacer()
                        HStack {
                            Spacer()
                            cancelPictureButton
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }
                } else {
                    takePictureButton
                }
            }
        }
        .onAppear {
            cameraVM.checkAuthorization()
        }
    }

    var cancelPictureButton: some View {
        Button { cameraVM.reTakePicture() } label: {
            Text("Retake")
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(.white)
                .clipShape(Capsule())
        }
    }

    var takePictureButton: some View {
        Button { cameraVM.takePicture() } label: {
            ZStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 68, height: 68)
                Circle()
                    .stroke(.white, lineWidth: 2)
                    .frame(width: 75, height: 75)
            }
        }
    }

}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(cameraVM: CameraViewModel())
    }
}
