//
//  ItunesRepository.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import Foundation

public struct ItunesRepository: ItunesRepositoryProtocol {
	
	var dataSource: ItunesApiServiceProtocol
	
	init(dataSource: ItunesApiServiceProtocol) {
		self.dataSource = dataSource
	}
	
	public func fetchSong() async -> Result<[SongModel], ItunesApiError> {
		
		switch await dataSource.fetchListSongs() {
		case let .success(songDTO):
			print("Repo", songDTO)
			return .success(songDTO.map {$0.toDomainModel()})
		case let .failure(error):
			print("Repo error", error)
			return .failure(error)
		}
	}
}
