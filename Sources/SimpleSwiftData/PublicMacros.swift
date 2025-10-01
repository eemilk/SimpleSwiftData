//
//  PublicMacros.swift
//  SimpleSwiftData
//
//  Created by Eemil Karvonen on 1.10.2025.
//

import SwiftData

@attached(member, names: named(__autoRegistration))
public macro SimpleSwiftDataModel() =
    #externalMacro(module: "SimpleSwiftDataMacros", type: "SimpleModel")

@freestanding(expression)
public macro AutoSchema() -> Schema =
    #externalMacro(module: "SimpleSwiftDataMacros", type: "AutoSchemaMacro")
