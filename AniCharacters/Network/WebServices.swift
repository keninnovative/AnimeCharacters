//
//  WebServices.swift
//  AniCharacters
//
//  Created by Ken Nyame on 5/7/21.
//

import Foundation

public class WebServices: NSObject {
    private func sendGetRequest(_ url: URL, parameters: [String: String], completion: @escaping (Data?, Error?) -> Void) {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data,                            // is there data
                let response = response as? HTTPURLResponse,  // is there HTTP response
                (200 ..< 300) ~= response.statusCode,         // is statusCode 2XX
                error == nil else {                           // was there no error, otherwise ...
                    completion(nil, error)
                    return
            }
            
            completion(data, nil)
        }
        task.resume()
    }
    
    private func sendGetRequest(_ url: URL, completion: @escaping (Data?, Error?) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                  error == nil else {
                completion(nil, error)
                return
            }
            completion(data, nil)
        }
        task.resume()
    }
    
    func getAnimesBy(character: String, completion: @escaping ([Anime]?, Error?) -> Void){
        let url = APIConstants.searchURL
        let reqParams = ["q": character]
        sendGetRequest(url, parameters: reqParams) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
            }
            else{
                guard let data = data else {
                    print("Empty response")
                    completion(nil, nil)
                    return
                }
             
                do {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = APIConstants.dateFormat
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    let animes = try decoder.decode(Animes.self, from: data)
                    print(animes.results)
                    completion(animes.results, nil)
                } catch {
                    print(error)
                    completion(nil, error)
                }
                    
            }
        }
    }
}
