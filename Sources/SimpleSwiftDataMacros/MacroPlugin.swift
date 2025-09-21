//
//  MacroPlugin.swift
//  SimpleSwiftData
//
//  Created by Eemil Karvonen on 20.9.2025.
//

import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [SimpleModel.self, AutoSchemaMacro.self]
}
