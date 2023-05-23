//
//  ContactDetailView.swift
//  MyContacts
//
//  Created by AMALITECH MACBOOK on 23/05/2023.
//

import SwiftUI

struct ContactDetailView: View {

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var viewModel = ContactsViewModel()
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var isBuddy: Bool = false
    var contact: ContactModel

    var body: some View {
        VStack(alignment: .center, spacing: 24) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Name")
                    .foregroundColor(Color.gray)
                TextField("Enter Name", text: $name)
                    .font(.title3)
                Divider()
            }
            VStack(alignment: .leading, spacing: 12) {
                Text("Phone")
                    .foregroundColor(Color.gray)
                TextField("Enter title..", text: $phone)
                    .font(.title3)
                Toggle("My Buddy?", isOn: $isBuddy)
                Divider()
            }
            VStack(alignment: .center, spacing: 12) {
                Button(action: {
                    viewModel.remove(id: contact.id)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                        Text("Delete")
                            .foregroundColor(.red)
                    }
                }
                .buttonStyle(NiceButtonStyle())
            }
            Spacer()
        }
        .onAppear{
            name = contact.name
            phone = contact.phone
            isBuddy = contact.isBuddy
        }
        .navigationBarItems(
            trailing: Button(action: {
                viewModel.update(id: contact.id, name: name, phone: phone, isBuddy: isBuddy)
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
            }
        )
        .navigationBarTitle("Edit Todo", displayMode: .inline)
        .padding(24)
    }
}
