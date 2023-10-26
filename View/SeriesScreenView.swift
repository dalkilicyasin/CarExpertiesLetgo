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
            VStack(alignment: .center, spacing: 20){
                Spacer(minLength: 10)
                Text("Please Select the Body Type")
                    .foregroundStyle(.white).font(
                        .largeTitle
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(viewModel.bodyList, id: \.self){ index in
                            NavigationLink(destination: EngineScreenView(viewModel: EnginScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, serieId: viewModel.serieID, bodyType: index))){
                                Text(index)
                                    .font(
                                           .title
                                            .weight(.medium)
                                       )
                                       .foregroundColor(.blue)
                                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .padding(10)
                                    .multilineTextAlignment(.center)
                            }
                        }
                    }.padding(20)
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
