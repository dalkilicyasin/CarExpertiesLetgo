//
//  MakeScreenView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI
import Combine

struct MakeScreenView: View {
    @ObservedObject var viewModel: MakeScreenViewModel
    init(viewModel: MakeScreenViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        ZStack{
            viewModel.color.edgesIgnoringSafeArea(.all)
            VStack(alignment: .center, spacing: 30){
                Spacer(minLength: 10)
                Text("Please Select the Make")
                    .foregroundStyle(.white).font(
                        .largeTitle
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .padding(10)
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 2) {
                        ForEach(viewModel.modelList, id: \.id){ index in
                                NavigationLink(destination: ModelScreenView(viewModel: ModelScreenViewModel(makeId:" \(index.id ?? 1)", model: viewModel.model))){
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
    MakeScreenView(viewModel: MakeScreenViewModel(model: "Model"))
}
