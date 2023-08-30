//
//  NetworkManager.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 28.08.2023.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    private let baseURL = "https://www.avito.st/s/interns-ios/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    
    func getAds(completed: @escaping (Result<Ads, AvitoError>) -> Void) {
        let endpoint = baseURL + "main-page.json"

        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let ads = try decoder.decode(Ads.self, from: data)
                completed(.success(ads))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    
    
    func getDetail(for id: String, completed: @escaping (Result<Detail, AvitoError>) -> Void) {
        let endpoint = baseURL + "details/\(id).json"

        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let detail = try decoder.decode(Detail.self, from: data)    
                completed(.success(detail))
            } catch {
                completed(.failure(.invalidData))
            }
        }

        task.resume()
    }
    
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)

        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }

        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                        completed(nil)
                        return
                }

            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
