//
//  GetListSongsUseCase.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import Foundation

public protocol GetListSongsUseCaseProtocol {
	func execute() async -> Result<[SongModel], ItunesApiError>
}

public struct GetListSongsUseCase: GetListSongsUseCaseProtocol {
	
	let repository: ItunesRepositoryProtocol
	
	init(repository: ItunesRepositoryProtocol) {
		self.repository = repository
	}
	
	public func execute() async -> Result<[SongModel], ItunesApiError> {
		return await getListSongs()
	}

	public func getListSongs() async -> Result<[SongModel], ItunesApiError> {
		return await repository.fetchSong()
	}
}
