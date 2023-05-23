//
//  SingleContactView.swift
//  MyContacts
//
//  Created by AMALITECH MACBOOK on 23/05/2023.
//

import SwiftUI

    // SingleContact file

struct SingleContactView: View {

    @State private var isBuddy: Bool = false
    @ObservedObject private var viewModel = ContactsViewModel()
    var contact: ContactModel
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                VStack(spacing: 8){
                    HStack {
                        Text("Name:")
                        Text(contact.name)
                        Spacer()
                    }
                    HStack {
                        Text("Phone:")
                        Text(contact.phone)
                        Spacer()
                    }}
                Button(action: {
                    isBuddy.toggle()
                    viewModel.update(id: contact.id, name: contact.name, phone: contact.phone, isBuddy: isBuddy)
                }) {
                    Image(systemName: contact.isBuddy ? "heart.fill": "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor( contact.isBuddy ? Color.green: Color.gray)
                        .padding(.trailing)
                }
            }
        }
        .onAppear{
            isBuddy = contact.isBuddy
        }
        .padding(.all, 16)
    }
}

