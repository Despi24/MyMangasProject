//
//  ProyectoMisMangasApp.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 19/12/23.
//

import SwiftUI

@main
struct ProyectoMisMangasApp: App {
    @StateObject var vm = MangasVM()
    
    var body: some Scene {
        WindowGroup {
            MangasTabView()
                .environmentObject(vm)
        }
    }
}
