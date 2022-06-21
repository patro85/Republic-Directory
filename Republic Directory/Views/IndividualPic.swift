//
//  IndividualPic.swift
//  Republic Directory
//
//  Created by Patrick Mayo  on 6/20/22.
//

import SwiftUI

struct IndividualPic: View {
    var profilePicUrl = "https://edge.ldscdn.org/mobile/interview/02.jpg"
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: profilePicUrl))
            { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.white, lineWidth: 4)
                        }
                        .shadow(radius: 7)
                default:
                    VStack {
                        Spacer()
                        ProgressView()
                        Image(systemName: "person.circle")
                            .font(.largeTitle)
                            .padding()
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.gray)
                    .opacity(0.85)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.white, lineWidth: 4)
                    }
                    .shadow(radius: 7)
                }
            }
        }
    }
}

struct IndividualPic_Previews: PreviewProvider {
    static var previews: some View {
        IndividualPic()
    }
}
