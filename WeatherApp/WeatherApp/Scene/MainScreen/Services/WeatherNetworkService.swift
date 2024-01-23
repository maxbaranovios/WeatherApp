//
//  WeatherNetworkService.swift
//  WeatherApp
//
//  Created by Maxim Baranov on 22/01/2024.
//

import UIKit

public protocol WeatherNetworkServiceProtocol {
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void)
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void)
}

final class WeatherNetworkService: WeatherNetworkServiceProtocol {
    private let decoder = JSONDecoder()
    private let imageCash = NSCache<NSString, UIImage>()
    
    func fetchData<T: Decodable>(url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                }
                return
            }
            
            guard let decoder = self?.decoder else {
                print("Error, decoder in nil.")
                return
            }

            do {
                decoder.dateDecodingStrategy = .iso8601
                let decodedData = try decoder.decode(T.self, from: data)

                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
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
