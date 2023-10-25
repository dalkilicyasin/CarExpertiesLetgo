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
            VStack{
                Text("Please Select the model of year")
                    .foregroundStyle(.white).font(.largeTitle)
                ScrollView{
                    VStack {
                        ForEach(viewModel.modelList, id: \.id){ index in
                                NavigationLink(destination: ModelScreenView(viewModel: ModelScreenViewModel(makeId:" \(index.id ?? 1)", model: viewModel.model))){
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
    MakeScreenView(viewModel: MakeScreenViewModel(model: "Model"))
}
