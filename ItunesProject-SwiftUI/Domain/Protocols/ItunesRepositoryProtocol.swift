//
//  ItunesRepositoryProtocol.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import Foundation

protocol ItunesRepositoryProtocol {
	func fetchSong() async -> Result<[SongModel], ItunesApiError>
}
