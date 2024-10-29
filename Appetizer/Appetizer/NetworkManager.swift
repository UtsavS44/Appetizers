import Foundation
import UIKit
final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    static let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APEror>) -> Void) {
        guard let url = URL(string: NetworkManager.appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let error = error {
                print("Error occurred: \(error.localizedDescription)")
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completed(.failure(.invalidResponse))
                return
            }
            
            print("HTTP Status Code: \(response.statusCode)")
            
            guard response.statusCode == 200 else {
                print("Invalid response from server: \(response.statusCode)")
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            // Debug: Print the raw JSON data
            if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                print("JSON Response: \(json)")
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                print("Failed to decode data: \(error.localizedDescription)")
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void){
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image =  UIImage(data: data)else{
                completed(nil)
                return
            }
        
        self.cache.setObject(image, forKey: cacheKey)
        completed(image)
    }
        task.resume()
    }
}
