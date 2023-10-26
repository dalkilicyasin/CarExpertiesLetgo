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
            VStack(alignment: .center, spacing: 20){
                Spacer(minLength: 10)
                Text("Please Select the Engine Type")
                    .foregroundStyle(.white).font(
                        .largeTitle
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(viewModel.engineList, id: \.self){ index in
                            NavigationLink(destination: TransmissionTypeScreenView(viewModel: TransmissonTypeViewModel(makeId: viewModel.makeId, model: viewModel.model, serieId: viewModel.serieId, bodyType: viewModel.bodyType, engineType: index))){
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
            viewModel.filterEngineList() //Filtered multiple elements
        }
    }
}

#Preview {
    EngineScreenView(viewModel: EnginScreenViewModel(makeId: "MakeId", model: "model", serieId: "serieId", bodyType: "BodyType"))
}
