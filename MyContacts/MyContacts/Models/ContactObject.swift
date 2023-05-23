//
//  ContactObject.swift
//  MyContacts
//
//  Created by AMALITECH MACBOOK on 23/05/2023.
//


import RealmSwift
    // ContactObject
class ContactObject: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String
    @Persisted var phone: String
    @Persisted var isBuddy: Bool
}
