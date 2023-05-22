//
//  ImageCache+Util.swift
//  ZohoWisdomTask
//
//  Created by KOSURU UDAY SAIKUMAR on 26/12/22.
//

import Foundation
import UIKit

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}

extension UIImage {
    var jpeg: Data? { jpegData(compressionQuality: 1) }  // QUALITY min = 0 / max = 1
    var png: Data? { pngData() }
}
extension Data {
    var uiImage: UIImage? { UIImage(data: self) }
}



let imageCache = NSCache<AnyObject, AnyObject>()

// MARK: - UIImageView extension
//extension UIImageView {
//
//    /// This loadThumbnail function is used to download thumbnail image using urlString
//    /// This method also using cache of loaded thumbnail using urlString as a key of cached thumbnail.
//    func loadThumbnail(urlSting: String) {
//        guard let url = URL(string: urlSting) else { return }
//        image = nil
//
//        if let imageFromCache = imageCache.object(forKey: urlSting as AnyObject) {
//            image = imageFromCache as? UIImage
//            return
//        }
//        ImageNetworking.downloadImage(url: url) { [weak self] result in
//            guard let self = self else { return }
//            switch result {
//            case .success(let data):
//                guard let imageToCache = UIImage(data: data) else { return }
//                imageCache.setObject(imageToCache, forKey: urlSting as AnyObject)
//                self.image = UIImage(data: data)
//            case .failure(_):
//                self.image = UIImage(named: "noImage")
//            }
//        }
//    }
//}
