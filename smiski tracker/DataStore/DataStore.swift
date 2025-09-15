//
//  DataStore.swift
//  smiski tracker
//
//  Created by Shanaz Yeo on 15/9/25.
//

import Foundation

class DataStore {
    static let shared  = DataStore() //enables SwiftData to read and write model data without knowledge of the underlying storage mechanism
    
    private var categories: [Category] = []
    private let filename: String = "smiski_tracker_data.json"
    private let url: URL? = Bundle.main.url(forResource: "smiski_tracker_data", withExtension: "json")
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getCategory(for name: String) throws -> Category {
        if let found = categories.first(where: { $0.name == name}) {
            return found
        }
        throw AppError.categoryNotFound
    }
    
    func load() {
        guard let url else {
            print("Unable to retrieve url of data")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let categories = try JSONDecoder().decode([Category].self, from: data)
            print("Data successfully loaded")
            print(categories)
        } catch {
            print("Error loading JSON from bundle: \(error)")
        }
    }
    
    func save() {
        guard let url else {
            print("Unable to retrieve url of data")
            return
        }
        
        do {
            let data = try JSONEncoder().encode(categories)
            try data.write(to: url, options: [.atomic]) // what is this
            print("Data successfully saved")
        } catch {
            print("Error: Failed to save data")
        }
    }
}
