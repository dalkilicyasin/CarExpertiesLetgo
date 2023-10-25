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
            VStack(alignment: .center, spacing: 20){
                Spacer(minLength: 10)
                Text("Please Select the Trim Type")
                    .foregroundStyle(.white).font(
                        .largeTitle
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(viewModel.modelList , id: \.id){ index in
                            NavigationLink(destination: ColorScreenView(viewModel: ColorScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, serieId: viewModel.serieId, bodyType: viewModel.bodyType, transmissionType: viewModel.transmissionType, trim: viewModel.trim, trimID: index.id ?? 0))){
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
        }
    }
}

#Preview {
    TrimScreenView(viewModel: TrimScreenViewModel(makeId: "MakeId", model: "model", serieId: "serieId", bodyType: "BodyType", transmissionType: "Transmission", trim: "trim"))
}

