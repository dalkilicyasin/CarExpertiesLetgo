//
//  EnterKMScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 25.10.2023.
//

import SwiftUI
import Combine
import Foundation

struct EnterKMScreenView: View {
    @ObservedObject var viewModel: EnterKMScreenViewModel
    init(viewModel: EnterKMScreenViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
            viewModel.color.edgesIgnoringSafeArea(.all)
            VStack{
                Text("Please Select the model of year")
                    .foregroundStyle(.white).font(.largeTitle)
                ScrollView{
                    VStack {
                        Button {
                            viewModel.fetch()
                        } label: {
                            Text("Pricing")
                                .font(.title)
                                .background(Color.white)
                                .padding(25)
                        }

                          /*  NavigationLink(destination: EnterKMScreenView(viewModel: EnterKMScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, serieId: viewModel.serieId, bodyType: viewModel.bodyType, transmissionType: viewModel.transmissionType, trim: viewModel.trim))){
                              
                                Text("Pricing")
                                    .font(.title)
                                    .background(Color.white)
                                    .padding(25)
                            }*/
                    }
                }
            }
        }
    }
}

#Preview {
    ColorScreenView(viewModel: ColorScreenViewModel(makeId: "MakeId", model: "model", serieId: "serieId", bodyType: "BodyType", transmissionType: "Transmission", trim: "trim"))
}

