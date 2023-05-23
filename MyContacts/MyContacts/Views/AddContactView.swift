//
//  AddContactView.swift
//  MyContacts
//
//  Created by AMALITECH MACBOOK on 23/05/2023.
//

import SwiftUI


struct AddContactView: View {
    @State private var viewModel = ContactsViewModel()
    @State private var name: String = ""
    @State private var phone: String = ""
    @State private var isBuddy: Bool = false
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(spacing: 20) {

            Text("Enter contact details")
            TextField("Enter Name", text: $name)
                .textFieldStyle(NiceTextFieldStyle())
            TextField("Enter Phone Number", text: $phone)
                .textFieldStyle(NiceTextFieldStyle())
            Toggle("My Buddy?", isOn: $isBuddy)
            Button(action: submitContact) {
                Text("Add Contact")
                    .foregroundColor(.orange)
            }
            .buttonStyle(NiceButtonStyle())
        }
        .padding(20)
    }

    private func submitContact() {
        viewModel.addContact(name: name, phone: phone, isBuddy: isBuddy)
        dismiss()
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactView()
    }
}
