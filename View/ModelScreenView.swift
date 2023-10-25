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
            VStack(alignment: .center, spacing: 20){
                Spacer(minLength: 10)
                Text("Please Select the Model")
                    .foregroundStyle(.white).font(
                        .largeTitle
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(viewModel.modelList , id: \.id){ index in
                            NavigationLink(destination: SeriesScreenView(viewModel: SeriesScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, serieID: "\(index.id ?? 1)"))){
                                Text("\(index.name ?? "")")
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
    ModelScreenView(viewModel: ModelScreenViewModel(makeId: "MakeId", model: "model"))
}
