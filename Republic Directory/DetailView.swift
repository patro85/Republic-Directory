//
//  DetailView.swift
//  Republic Directory
//
//  Created by Patrick Mayo  on 6/20/22.
//

import SwiftUI
import GaugeProgressViewStyle
import Trigonometry

struct DetailView: View {
    
    var firstName = "Leia"
    var lastName = "Organa"
    var birthdate = "1963-05-05"
    var affiliation = "RESISTANCE"
    var lastModified = "2021-07-28T06:48:56.265Z"
    var forceSensitivity = true
    var profilePicture = "test"
    
    var body: some View {
        ScrollView {
            VStack {
                IndividualPic(profilePicUrl: profilePicture)
                    .frame(width: 300, height: 300)
                HStack {
                    Text("\(firstName)")
                        .font(.largeTitle)
                        .bold()
                    Text("\(lastName)")
                        .font(.largeTitle)
                }
                .padding(5)
                Divider()
                Text("\(birthdate)")
                    .font(.caption)
                HStack {
                    Spacer()
                    VStack {
                        var forceValue = forceSensitivity ? 1.0 : 0.0
                        Text("Force Sensitivity")
                            .font(.caption)
                        ProgressView(value: forceValue)
                            .progressViewStyle(
                                .gauge(thickness: 15) {
                                    Image(systemName: "person.fill")
                                } upperLabel: {
                                    Image(systemName: "shareplay")
                                }
                            )
                            .frame(width: 150, height: 150)
                    }
                    .padding()
                    VStack {
                        Text("Affiliation")
                            .font(.caption)
                        ZStack {
                            Circle()
                                .foregroundColor(.white)
                                .aspectRatio(1, contentMode: .fit)
                                .frame(width: 150, height: 150)
                            Image(affiliation)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                        }
                    }
                    Spacer()
                }
                Text("Last Modified: \(lastModified)")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .padding()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
        
    }
}

