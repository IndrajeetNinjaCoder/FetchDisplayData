//
//  ViewModel.swift
//  FetchDisplayData
//
//  Created by test on 29/01/25.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var peoples: [People] = []
    
    
    func getData() async{
        
        // Creating URL
        guard let url = URL(string: "https://swapi.dev/api/people") else{
            return
        }
        
        do {
            // Fetching Data using URLSession
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decoding the data into APIResponse
            if let decodedResponse = try? JSONDecoder().decode(APIResponse.self, from: data) {
                self.peoples = decodedResponse.results
                
            }
            
        } catch {
            print("Invalid Response")
        }
        
    }
    
}

