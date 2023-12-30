//
//  MangasTabView.swift
//  ProyectoMisMangas
//
//  Created by Alex Peinado Llopis on 20/12/23.
//

import SwiftUI

struct MangasTabView: View {
    @EnvironmentObject var vm: MangasVM
    
    var body: some View {
        TabView {
            UserCollectionView()
                .tabItem {
                    Label("My Collection", systemImage: "books.vertical")
                }
                .tag(1)
            MangasListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(2)
        }
    }
}

#Preview {
    MangasTabView()
        .environmentObject(MangasVM.testVM)
}
