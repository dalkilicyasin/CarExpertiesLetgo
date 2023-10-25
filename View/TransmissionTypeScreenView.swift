//
//  TransmissionTypeScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI
import Combine
import Foundation

struct TransmissionTypeScreenView: View {
    @ObservedObject var viewModel: TransmissonTypeViewModel
    init(viewModel: TransmissonTypeViewModel) {
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
                            NavigationLink(destination: TrimScreenView(viewModel: TrimScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, serieId: viewModel.serieId, bodyType: viewModel.bodyType, transmissionType: viewModel.transmissionType, trim: index.name ?? ""))){
                                Text("\(index.transmission?.name ?? "")")
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
    TransmissionTypeScreenView(viewModel: TransmissonTypeViewModel(makeId: "MakeId", model: "model", serieId: "serieId", bodyType: "BodyType", transmissionType: "Transmission"))
}
