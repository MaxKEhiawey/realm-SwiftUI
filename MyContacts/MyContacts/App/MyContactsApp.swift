//
//  MyContactsApp.swift
//  MyContacts
//
//  Created by AMALITECH MACBOOK on 22/05/2023.
//

import SwiftUI

@main
struct MyContactsApp: App {
    var body: some Scene {
        WindowGroup {
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}
