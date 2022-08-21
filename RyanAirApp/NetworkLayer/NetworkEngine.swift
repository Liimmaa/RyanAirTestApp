//
//  NetworkEngine.swift
//  RyanAirApp
//
//  Created by Chioma Amanda Mmegwa  on 17/08/2022.
//

import Foundation

class NetWorkEngine {
    /// Executes the web call and will decode the JSON response into the codable object provided
    /// - Parameters:
    ///  - endpoint: the endpoint to make the HTTP request against
    ///  - completion: the JSON response converted to the provided Codable Object, if successful or failure otherwise

    //1 Takes in a parameter that implements the Endpoint protocol and returns a completion block with a codable object if the network request succeds or an error
    class func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> ()) {
        //2 Build the URL by assigning the enpoint properties to a URLComponents object
        var components = URLComponents()
        components.scheme = endpoint.scheme
        components.path = endpoint.path
        components.host = endpoint.baseURL
        components.queryItems = endpoint.parameters
        
        //3 Check that the URL was constructed or properly and is not nil
        guard let url = components.url else { return }
        
        //4 Use URL object to create a url session and set http method
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = endpoint.method
        
        //5 Get a reference to URLSession and define dataTask
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: url) { data, response, error in
            
            //6 Basic error handling and validation
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription ?? "Unknown error")
                return
            }
            
            guard response != nil, let data = data else { return }
            
            //7 Covert data from the response into the decodable object
            DispatchQueue.main.async {
                if let responseObject = try? JSONDecoder().decode(T.self, from: data) {
                    //8 If everythting suceeds, provide the rvalue in the completion block
                    completion(.success(responseObject))
                } else {
                    //9 Cretae an error definition and pass that back instead
                    let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response"])
                    print(error.localizedDescription, "Error: ")
                    completion(.failure(error))
                }
            }
        }
        //10 Trigger the request
        dataTask.resume()
    }
}
