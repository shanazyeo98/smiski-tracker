//
//  Category.swift
//  smiski tracker
//
//  Created by Shanaz Yeo on 15/9/25.
//

import Foundation

struct Category: Codable, Hashable {
    var name: String
    var items: [Item]
}
