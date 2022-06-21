//
//  SplashScreenView.swift
//  Directory of the Republic
//
//  Created by Patrick Mayo  on 6/16/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                VStack {
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .aspectRatio(1, contentMode: .fit)
                        Image("galacticrepublic_logo")
                            .resizable()
                            .aspectRatio(1, contentMode: .fit)
                    }
                    Text("Republic Directory")
                        .font(.title)
                        .bold()
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
                getTheData()
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
            .preferredColorScheme(.light)
    }
}
