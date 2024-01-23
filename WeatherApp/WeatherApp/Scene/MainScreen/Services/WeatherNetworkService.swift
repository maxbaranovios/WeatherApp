//
//  WeatherNetworkService.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 22/01/2024.
//

import UIKit

public enum NetworkError: Error {
    case badData
    case badResponse
    case badRequest
    case badDecode
    case unknown(String)
}

public protocol WeatherNetworkServiceProtocol {
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void)
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void)
}

final class WeatherNetworkService: WeatherNetworkServiceProtocol {
    private let decoder = JSONDecoder()
    private let imageCash = NSCache<NSString, UIImage>()
    
    init() {
        decoder.dateDecodingStrategy = .iso8601
    }
    
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil  else {
                return completion(.failure(.badData))
            }
            
            guard let response = response as? HTTPURLResponse else {
                return completion(.failure(.badResponse))
            }
            
            switch response.statusCode {
            case 200...299:
                do {
                    let decodedData = try self.decoder.decode(T.self, from: data)

                    completion(.success(decodedData))
                } catch {
                    completion(.failure(.badDecode))
                }
            case 400:
                completion(.failure(.badRequest))
            default:
                completion(.failure(.unknown("Something went wrong")))
            }
        }.resume()
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cashedImage = imageCash.object(forKey: url.absoluteString as NSString) {
            completion(cashedImage)
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            guard let data = data else {
                print("No image data")
                return
            }

            if let image = UIImage(data: data) {
                self?.imageCash.setObject(image, forKey: url.absoluteString as NSString)
                completion(image)
            } else {
                print("Failed to create UIImage from data")
            }
        }.resume()
    }
}

extension WeatherNetworkService {
    public static func build() -> WeatherNetworkService {
        WeatherNetworkService()
    }
}
