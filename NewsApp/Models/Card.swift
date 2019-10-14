//
//  Card.swift
//  NewsApp
//
//  Created by Sudarshan,Manoj on 13/10/19.
//  Copyright © 2019 Sudarshan,Manoj. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Response
struct Card : Hashable, Identifiable, Decodable {
    let id = UUID()
    let article_url: String
    let card_token, description: String
    let image_url: String
    let name: String
    let published_at: String
    let source: String
}
