//
//  RegistryRuntime.swift
//  SimpleSwiftData
//
//  Created by Eemil Karvonen on 20.9.2025.
//

import SwiftData

// MARK: - File-scoped registry support
// Each source file that declares @AutoRegisterModel types gets its own LocalRegistry bucket.
// The freestanding macro #AutoSchema() expands to Schema(LocalRegistry.models) for *that file*.

public enum LocalRegistry {
    // The macro adds items to this var *within the file that uses the macro* by generating
    // a same-named symbol in that file's scope (fileprivate shadowing). Here we just provide
    // the shape/type — the macro expansion provides the storage per file.
    public static var models: [any PersistentModel.Type] { [] }
}

// Convenience helpers for your app to construct containers
public enum CacheContainerFactory {
    public static func makeContainer(inMemory: Bool = false, schema: Schema) -> ModelContainer {
        do {
            let config = ModelConfiguration(schema: schema, isStoredInMemoryOnly: inMemory)
            return try ModelContainer(for: schema, configurations: [config])
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }
}
