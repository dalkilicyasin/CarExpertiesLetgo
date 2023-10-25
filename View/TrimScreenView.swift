//
//  TrimScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI
import Combine
import Foundation

struct TrimScreenView: View {
    @ObservedObject var viewModel: TrimScreenViewModel
    init(viewModel: TrimScreenViewModel) {
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
                        ForEach(viewModel.modelList , id: \.id){ index in
                            NavigationLink(destination: ColorScreenView(viewModel: ColorScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, serieId: viewModel.serieId, bodyType: viewModel.bodyType, transmissionType: viewModel.transmissionType, trim: viewModel.trim))){
                                Text("\(index.name ?? "")")
                                    .font(.title)
                                    .background(Color.white)
                                    .padding(25)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    TrimScreenView(viewModel: TrimScreenViewModel(makeId: "MakeId", model: "model", serieId: "serieId", bodyType: "BodyType", transmissionType: "Transmission", trim: "trim"))
}

