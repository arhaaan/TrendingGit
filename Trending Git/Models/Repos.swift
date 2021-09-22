//
//  Repos.swift
//  Trending Git
//
//  Created by Karim Arhan on 22/09/21.
//  Copyright © 2021 Karim Arhan. All rights reserved.
//

import Foundation

struct Repos: Codable {
    var totalCount: Int?
    var incompleteResults: Bool?
    var items: [Item]?

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
