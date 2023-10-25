//
//  EngineScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI
import Combine
import Foundation

struct EngineScreenView: View {
    @ObservedObject var viewModel: EnginScreenViewModel
    init(viewModel: EnginScreenViewModel) {
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
                            NavigationLink(destination: TransmissionTypeScreenView(viewModel: TransmissonTypeViewModel(makeId: viewModel.makeId, model: viewModel.model, serieId: viewModel.serieId, bodyType: viewModel.bodyType, transmissionType: index.transmission?.name ?? ""))){
                                Text("\(index.engine?.name ?? "")")
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
    EngineScreenView(viewModel: EnginScreenViewModel(makeId: "MakeId", model: "model", serieId: "serieId", bodyType: "BodyType"))
}
