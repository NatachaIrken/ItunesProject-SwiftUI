//
//  ItunesApiServiceProtocol.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import Foundation

protocol ItunesApiServiceProtocol {
	func fetchListSongs() async -> Result<[SongDTO], ItunesApiError>
}
