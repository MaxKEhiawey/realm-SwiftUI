//
//  ContactsViewModel.swift
//  MyContacts
//
//  Created by AMALITECH MACBOOK on 23/05/2023.
//

import Foundation
import RealmSwift

class ContactsViewModel: ObservableObject {
    
    @ObservedResults(ContactObject.self) var contactLists
    @Published var contacts: [ContactModel] = []

    private var token: NotificationToken?

    init() {
        setupObserver()
    }

    deinit {
        token?.invalidate()
    }

    private func setupObserver() {
        do {
            let realm = try Realm()
            let results = realm.objects(ContactObject.self)

            token = results.observe({ [weak self] changes in
                self?.contacts = results.map(ContactModel.init)
                    .sorted(by: { $0.name > $1.name })
            })
        } catch let error {
            print(error.localizedDescription)
        }
    }
        // Add contact
    func addContact(name: String, phone: String, isBuddy: Bool) {
        let contact = ContactObject()
        contact.name = name
        contact.phone = phone
        contact.isBuddy = isBuddy
        $contactLists.append(contact)
    }


        // Delete contact
    func remove(id: String) {
        do {
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            if let contact = realm.object(ofType: ContactObject.self, forPrimaryKey: objectId) {
                try realm.write {
                    realm.delete(contact)
                }
            }
        } catch let error {
            print(error)
        }
    }
        // Update contact
    func update(id: String, name: String, phone: String, isBuddy: Bool) {
        do {
            let realm = try Realm()
            let objectId = try ObjectId(string: id)
            let contact = realm.object(ofType: ContactObject.self, forPrimaryKey: objectId)
            try realm.write {
                contact?.name = name
                contact?.phone = phone
                contact?.isBuddy = isBuddy
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
