//
//  ColorScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 25.10.2023.
//

import SwiftUI
import Combine
import Foundation

struct ColorScreenView: View {
    @ObservedObject var viewModel: ColorScreenViewModel
    init(viewModel: ColorScreenViewModel) {
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
                        ForEach(viewModel.colorList , id: \.id){ index in
                            NavigationLink(destination: EnterKMScreenView(viewModel: EnterKMScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, serieId: viewModel.serieId, bodyType: viewModel.bodyType, transmissionType: viewModel.transmissionType, trim: viewModel.trim))){
                                Text("\(index.name ?? "")")
                                    .font(.title)
                                    .background(Color.white)
                                    .padding(25)
                            }
                        }
                    }
                }
            }
        }.onAppear{
            viewModel.fetch()
        }
    }
}

#Preview {
    ColorScreenView(viewModel: ColorScreenViewModel(makeId: "MakeId", model: "model", serieId: "serieId", bodyType: "BodyType", transmissionType: "Transmission", trim: "trim"))
}

