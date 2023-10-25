//
//  SeriesScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI
import Combine

struct SeriesScreenView: View {
    @ObservedObject var viewModel: SeriesScreenViewModel
    init(viewModel: SeriesScreenViewModel) {
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
                        ForEach(viewModel.modelList, id: \.id){ index in
                            NavigationLink(destination: EngineScreenView(viewModel: EnginScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, serieId: viewModel.serieID, bodyType: index.body_config?.name ?? ""))){
                                Text("\(index.body_config?.name ?? "")")
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
    SeriesScreenView(viewModel: SeriesScreenViewModel(makeId: "MakeId", model: "model", serieID: "serieId"))
}
