//
//  PublicMacros.swift
//  SimpleSwiftData
//
//  Created by Eemil Karvonen on 1.10.2025.
//

import SwiftData
import SwiftSyntaxMacros

@attached(member, names: named(__autoRegistration))
public macro SimpleSwiftDataModel() =
    #externalMacro(module: "SimpleSwiftDataMacros", type: "SimpleModel")

@freestanding(expression)
public macro AutoSchema() -> Schema =
    #externalMacro(module: "SimpleSwiftDataMacros", type: "AutoSchemaMacro")
