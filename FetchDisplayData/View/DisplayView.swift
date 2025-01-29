//
//  DisplayView.swift
//  FetchDisplayData
//
//  Created by test on 29/01/25.
//

import SwiftUI

struct DisplayView: View {
    
    @StateObject var viewModel = ViewModel()
    
    //    @State private var peoples: [People] = []
    
    var body: some View {
        NavigationView {
            
            VStack {
                List(viewModel.peoples) { (people: People) in
                    HStack(spacing: 10) {
                        VStack{
                            Text("\(people.name)")
                                .font(.headline)
                            Text("\(people.gender)")
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        VStack {
                            Text("Height: \(people.height) cm")
                            Text("Birth on: \(people.birth_year)")
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .leading, endPoint: .trailing)
                    )
                    .cornerRadius(10)
                }
            }
            
            .navigationTitle("Peoples")
            .task {
                await viewModel.getData()
            }
        }
    }
}

#Preview {
    DisplayView()
}
