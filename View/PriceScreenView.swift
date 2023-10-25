//
//  PriceScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 25.10.2023.
//

import SwiftUI
import Combine
import Foundation

struct PriceScreenView: View {
    @ObservedObject var viewModel: PriceScreenViewModel
    init(viewModel: PriceScreenViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
            viewModel.color.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center){
                Text("Car Experties Values")
                    .foregroundStyle(.white).font(.largeTitle)
                ScrollView{
                    VStack {
                        PriceView(model: viewModel.model, carName: viewModel.trim, engineType: viewModel.engineType, transmissionType: viewModel.transmissionType, colorCar: viewModel.colorCar, kilometer: viewModel.km, carPrice: String(viewModel.price))
                    }
                }
            }
        }
    }
}

#Preview {
    PriceScreenView(viewModel: PriceScreenViewModel(model: "", bodyType: "", transmissionType: "", trim: "", engineType: "", colorCar: "", km: "", price: 10))
}
