//
//  SimpleModel.swift
//  SimpleSwiftData
//
//  Created by Eemil Karvonen on 20.9.2025.
//

import SwiftSyntaxMacros
import SwiftCompilerPlugin
import Foundation

/// Put this on each @Model you want auto-registered.
/// Example:
/// @SimpleModel
/// @Model final class Item { ... }
public struct SimpleModel: MemberMacro {}

/// Freestanding macro you call once per file that contains models:
/// let schema: Schema = #AutoSchema()
public struct AutoSchemaMacro {}
