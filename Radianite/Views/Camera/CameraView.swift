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
            Color.black
                .ignoresSafeArea(.all, edges: .all)
            VStack {
                Spacer()
                if cameraVM.isPictureTaken {
                    HStack {
                        Spacer()
                        Button { } label: {
                            Text("Save")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 16)
                                .background(.white)
                                .clipShape(Capsule())
                        }
                        .padding(.trailing, 16)
                    }
                } else {
                    Button { cameraVM.isPictureTaken.toggle() } label: {
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
        }
        .onAppear {
            cameraVM.checkAuthorization()
        }
    }

}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(cameraVM: CameraViewModel())
    }
}
