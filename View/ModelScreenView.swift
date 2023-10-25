//
//  TrimScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI
import Combine
import Foundation

struct ModelScreenView: View {
    @ObservedObject var viewModel: ModelScreenViewModel
    init(viewModel: ModelScreenViewModel) {
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
                            NavigationLink(destination: SeriesScreenView(viewModel: SeriesScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, serieID: "\(index.id ?? 1)"))){
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
    ModelScreenView(viewModel: ModelScreenViewModel(makeId: "MakeId", model: "model"))
}
