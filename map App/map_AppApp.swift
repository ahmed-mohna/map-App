//
//  map_AppApp.swift
//  map App
//
//  Created by Ahmed Mohna on 04/08/2022.
//

import SwiftUI

@main
struct map_AppApp: App {
    @StateObject var vm = LocatinViewModel()
    var body: some Scene {
      

        WindowGroup {
            LocationView()
                .environmentObject(vm)
        }
    }
}
