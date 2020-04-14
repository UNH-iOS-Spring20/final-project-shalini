//
//  NetworkManager.swift
//  Angela_yu
//
//  Created by Shalu Garikapaty on 3/16/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    // user does something like update or does something that gets into thr json filr
   @Published var posts = [Post]()
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            //MARK:- session is fetching data
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results =  try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                    
                }
                
            }
            task.resume()
        }
    }
}
