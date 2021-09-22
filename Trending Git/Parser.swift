//
//  Parser.swift
//  Trending Git
//
//  Created by Karim Arhan on 22/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import Foundation

struct Parser {
    
    
    func parse(comp: @escaping ([Item])->() ) {
        
        let api = URL(string: "https://api.github.com/search/repositories?q=spotify&page=1&per_page=10")!
        
        URLSession.shared.dataTask(with: URLRequest(url: api)){data,response,error in
            DispatchQueue.main.async {
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                do{
                    let result = try JSONDecoder().decode(Repos.self, from: data!)
                    comp(result.items!)
                }catch{
                
                }
            }
            
        }.resume()
        
    }
    
    func getRepo(completion: @escaping(Repos?) -> Void){
        let url = "https://api.github.com/search/repositories?q=spotify&page=1&per_page=10"
               
        let urlstring = URL(string: url)!
        let request = URLRequest(url: urlstring)
        
        URLSession.shared.dataTask(with: request) { (data, urlResponse, error) in
            DispatchQueue.main.async {
                if let data = data{
                    do{
                        let decoder = JSONDecoder()

                        let repoItems = try decoder.decode(Repos.self, from: data)
                        completion(repoItems)
                        
                    }catch{
                        let _error = error
                        print(String(describing: _error))
                    }
                }
                if let response = urlResponse as? HTTPURLResponse{
                    
                    print(response.statusCode)
                }
            }
            
        }.resume()
               
    }
}
