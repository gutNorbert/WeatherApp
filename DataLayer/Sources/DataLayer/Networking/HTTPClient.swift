//
//  HTTPClient.swift
//  WeatherApp
//
//  Created by Norbert Gutpinter on 27/06/2024.
//

import Foundation
import Combine
import DomainLayer

public protocol APIClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint,
                                   responseModel: T.Type,
                                   queries: [URLQueryItem]?) -> Future<T, HTTPError>
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
                                          queries: [URLQueryItem]? = nil) -> Future<T, HTTPError> {
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return Future<T, HTTPError> { [weak self] promise in
            guard let url = self?.setupURL(endpoint: endpoint, queries: queries),
                  let self
            else { return promise(.failure(HTTPError.invalidURL)) }
            
            self.session.dataTaskPublisher(for: url)
                .tryMap { (data, response) -> Data in
                    guard let httpResponse = response as? HTTPURLResponse
                    else { throw HTTPError.responseError }
                    
                    switch httpResponse.statusCode {
                    case 200...299:
                        return data
                    default:
                        throw HTTPError.badResponse(statusCode: httpResponse.statusCode)
                    }
                }
                .decode(type: T.self, decoder: self.jsonDecoder)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(_):
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
