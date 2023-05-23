//
//  NewsModel.swift
//  SCG-Test
//
//  Created by KOSURU UDAY SAIKUMAR on 22/05/23.
//

import UIKit

class NewsModel: Decodable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String
}

struct Source: Codable {
    let name: String
}
