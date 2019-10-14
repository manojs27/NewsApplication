//
//  Response.swift
//  NewsApp
//
//  Created by Sudarshan,Manoj on 13/10/19.
//  Copyright © 2019 Sudarshan,Manoj. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Response
struct Response :Hashable, Decodable {
    let cards: [Card]
}
