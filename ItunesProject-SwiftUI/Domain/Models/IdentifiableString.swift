//
//  IdentifiableString.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import Foundation

struct IdentifiableString: Identifiable {
	let id = UUID()
	let value: String
}
