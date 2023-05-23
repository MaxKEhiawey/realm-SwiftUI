//
//  ContactModel.swift
//  MyContacts
//
//  Created by AMALITECH MACBOOK on 23/05/2023.
//

import Foundation

    // ContactModel
struct ContactModel: Identifiable {
    var id: String
    var name: String
    var phone: String
    var isBuddy: Bool = false

    init(contact: ContactObject) {
        self.id = contact.id.stringValue
        self.name = contact.name
        self.phone = contact.phone
        self.isBuddy = contact.isBuddy
    }
}
