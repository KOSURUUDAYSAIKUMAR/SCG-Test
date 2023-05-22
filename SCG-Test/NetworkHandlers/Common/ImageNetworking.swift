//
//  ImageNetworking.swift
//  WisdomTask
//
//  Created by KOSURU UDAY SAIKUMAR on 10/05/23.
//

import Foundation

/// Result enum is a generic for any type of value
/// with success and failure case
public enum ImageResult<T> {
    case success(T)
    case failure(Error)
}

final class ImageNetworking: NSObject {
    
    // MARK: - Private functions
    private static func getData(url: URL,
                                completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    // MARK: - Public function
    
    /// downloadImage function will download the thumbnail images
    /// returns Result<Data> as completion handler
    public static func downloadImage(url: URL,
                                     completion: @escaping (ImageResult<Data>) -> Void) {
        ImageNetworking.getData(url: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async() {
                completion(.success(data))
            }
        }
    }
}

