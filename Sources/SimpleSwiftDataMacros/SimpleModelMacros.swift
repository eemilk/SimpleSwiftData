//
//  SimpleModelMacros.swift
//  SimpleSwiftData
//
//  Created by Eemil Karvonen on 20.9.2025.
//

import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

enum MacroErr: Error, CustomStringConvertible { case notOnClass
    var description: String { "@SimpleModel can only be applied to class declarations." }
}

extension SimpleModel {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf decl: some DeclSyntaxProtocol,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let classDecl = decl.as(ClassDeclSyntax.self) else { throw MacroErr.notOnClass }
        let typeName = classDecl.name.text
        return [
            """
            @usableFromInline
            static let __autoRegistration: Void = { __registerType(\(raw: typeName).self) }()
            """
        ]
    }
}

extension AutoSchemaMacro: FreestandingMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        return ExprSyntax("""
        Schema({ () -> [any PersistentModel.Type] in
            var __models: [any PersistentModel.Type] = []
            @inline(__always) func __registerType(_ t: any PersistentModel.Type) { __models.append(t) }
            _ = 0
            return __models
        }())
        """)
    }
}

