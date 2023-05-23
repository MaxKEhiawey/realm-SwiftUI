    //
    //  ContentView.swift
    //  MyContacts
    //
    //  Created by AMALITECH MACBOOK on 22/05/2023.
    //

import SwiftUI
import RealmSwift
import Foundation

struct ContentView: View {
    @State var isPresentingSheet: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                ContactListView()
            }
            .padding()
            .navigationTitle("My Contacts")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(isPresented: $isPresentingSheet) {
                AddContactView()
            }
            .navigationBarItems(
                trailing: Button(action: {
                    isPresentingSheet.toggle()
                }) {
                    Image(systemName: "person.badge.plus")
                    Text("Add")
                }
            )

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}

