//
//  CarExpertiesLetGoApp.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI

@main
struct CarExpertiesLetGoApp: App {
    var body: some Scene {
        WindowGroup {
            CarModelYearView(viewModel: CarModelYearScreenViewModel())
        }
    }
}
