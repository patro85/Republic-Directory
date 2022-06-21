//
//  ContentView.swift
//  Republic Directory
//
//  Created by Patrick Mayo  on 6/20/22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(Person.thePerson.individuals) { person in                        
                        NavigationLink(destination: DetailView(firstName: person.firstName, lastName: person.lastName, birthdate: person.birthdate, affiliation: person.affiliation, lastModified: person.lastModified, forceSensitivity: person.forceSensitive, profilePicture: person.profilePicture)) {
                            Text("\(person.firstName) \(person.lastName)")
                        }
                    }
                }
                .navigationTitle("Republic Directory")
            }
            .onAppear {
                print()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
