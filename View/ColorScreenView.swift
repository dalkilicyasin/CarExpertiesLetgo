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
            VStack(alignment: .center, spacing: 30){
                Spacer(minLength: 10)
                Text("Please Select the Color")
                    .foregroundStyle(.white).font(
                        .largeTitle
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(viewModel.colorList , id: \.id){ index in
                            NavigationLink(destination: EnterKMScreenView(viewModel: EnterKMScreenViewModel(makeId: viewModel.makeId, model: viewModel.model, bodyType: viewModel.bodyType, transmissionType: viewModel.transmissionType, trim: viewModel.trim, trimID: viewModel.trimID, colorID: index.id ?? 0, colorCar: index.name ?? ""))){
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
            viewModel.filterTrim()
        }
    }
}

#Preview {
    ColorScreenView(viewModel: ColorScreenViewModel(makeId: "MakeId", model: "model", serieId: "serieId", bodyType: "BodyType", transmissionType: "Transmission", trim: "trim"))
}

