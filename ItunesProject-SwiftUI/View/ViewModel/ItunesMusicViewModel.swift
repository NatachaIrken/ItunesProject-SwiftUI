//
//  ItunesMusicViewModel.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import Foundation

class ItunesMusicViewModel: ObservableObject {
	
	@Published var songs: [Song] = []
	@Published var favorites: [Song] = []
	
	private let service: ItunesApiService = ItunesApiService()
	private let getListUseCase: GetListSongsUseCase
	
	init(getListUseCase : GetListSongsUseCaseProtocol) {
		self.getListUseCase = getListUseCase as! GetListSongsUseCase
	}
	
	@MainActor func fetchSongs() async {
		do {
			let result = await getListUseCase.execute()
			switch result {
			case .success(let songModel):
				songs = songModel.first?.results ?? []
			case .failure(_):
				ItunesApiError.unknown
			}
		}
	}
	
	func addFavorite(song: Song) {
		if !favorites.contains(song) {
			favorites.append(song)
		}
	}
	
	func removeFavorite(song: Song) {
		favorites.removeAll { $0 == song }
	}
	
	func isFavorite(song: Song) -> Bool {
		return favorites.contains(song)
	}
	
	func toggleFavorite(song: Song) {
		if isFavorite(song: song) {
			removeFavorite(song: song)
		} else {
			addFavorite(song: song)
		}
	}
}
