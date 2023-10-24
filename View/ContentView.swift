//
//  ContentView.swift
//  CarExpertiesLetGo
//
//  Created by yasin on 24.10.2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: CarModelScreenViewModel
    init(viewModel: CarModelScreenViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            ZStack{
                viewModel.color.edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Please Select the model of year")
                        .foregroundStyle(.white).font(.largeTitle)
                    ScrollView{
                        VStack {
                            ForEach(0..<viewModel.modelYears.count, id: \.self){ index in
                                Button {
                                    viewModel.goDetail = true
                                } label: {
                                    NavigationLink(destination: MakeScreenView(viewModel: MakeScreenViewModel(model:" \(viewModel.modelYears[index])")), isActive: $viewModel.goDetail){
                                        Text("\(viewModel.modelYears[index])")
                                            .font(.title)
                                            .background(Color.white)
                                            .padding(25)
                                    }
                                }
                            }
                        }
                    }
                }
            }.onAppear{
                viewModel.fetchModelYear()
            }
        }
    }
}

#Preview {
    ContentView(viewModel: CarModelScreenViewModel())
}
