//
//  ModelCache.swift
//  SimpleSwiftData
//
//  Created by Eemil Karvonen on 20.9.2025.
//

import SwiftData
import Foundation

@MainActor
public final class ModelCache<M: PersistentModel> {
    private let context: ModelContext

    public init(container: ModelContainer) { self.context = ModelContext(container) }
    public init(context: ModelContext) { self.context = context }

    public func fetch(
        predicate: Predicate<M>? = nil,
        sortBy: [SortDescriptor<M>] = []
    ) throws -> [M] {
        try context.fetch(FetchDescriptor<M>(predicate: predicate, sortBy: sortBy))
    }

    public func add(_ model: M) throws { context.insert(model); try context.save() }
    public func delete(_ model: M) throws { context.delete(model); try context.save() }
    public func saveIfNeeded() throws { if context.hasChanges { try context.save() } }
    public func count(predicate: Predicate<M>? = nil) throws -> Int {
        try context.fetchCount(FetchDescriptor<M>(predicate: predicate))
    }
}
