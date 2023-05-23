//
//  ContactListView.swift
//  MyContacts
//
//  Created by AMALITECH MACBOOK on 23/05/2023.
//

import SwiftUI

    // ContactList File
struct ContactListView: View {

    @State private var scale: CGFloat = 1.0
    @ObservedObject private var viewModel = ContactsViewModel()

    @State var isDetailRoute: Bool = false
    var body: some View {
        ScrollView {
            LazyVStack (alignment: .leading) {
                ForEach(viewModel.contacts, id: \.id) { contact in
                    SingleContactView(contact: contact)
                        .onTapGesture {
                            isDetailRoute.toggle()
                        }
                        .navigationDestination(isPresented: $isDetailRoute) {
                            ContactDetailView(contact: contact)
                        }
                    Divider().padding(.leading, 20)
                }
            }

        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
