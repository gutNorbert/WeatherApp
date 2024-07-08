//
//  HTTPClient.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import Combine

public protocol APIClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint,
                                   responseModel: T.Type,
                                   queries: [URLQueryItem]?) -> Future<T, RequestError>
}

public final class HTTPClient: APIClient {
    private var cancellables = Set<AnyCancellable>()
    private let jsonDecoder = JSONDecoder()
    private let session: URLSession
    
    public init() {
        let configuration = URLSessionConfiguration.default
        let delegate = CustomSessionDelegate()
        self.session = URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }
    
    public func sendRequest<T: Decodable>(endpoint: Endpoint,
                                          responseModel: T.Type,
                                          queries: [URLQueryItem]? = nil) -> Future<T, RequestError> {
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return Future<T, RequestError> { [weak self] promise in
            guard let url = self?.setupURL(endpoint: endpoint, queries: queries),
                  let self = self
            else { return promise(.failure(RequestError.invalidURL)) }
            
            self.session.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse
                    else { throw RequestError.responseError }
                    
                    switch httpResponse.statusCode {
                    case 200...299:
                        return data
                    default:
                        throw RequestError.badResponse(statusCode: httpResponse.statusCode)
                    }
                }
                .decode(type: T.self, decoder: self.jsonDecoder)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        promise(.failure(.decode))
                    }
                }, receiveValue: { promise(.success($0)) })
                .store(in: &self.cancellables)
        }
    }
    
    private func setupURL(endpoint: Endpoint,
                          queries: [URLQueryItem]? = nil) -> URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        if let queries {
            urlComponents.queryItems = queries
        }
        
        return urlComponents.url
    }
}
