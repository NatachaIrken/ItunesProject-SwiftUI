//
//  ItunesApiService.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import Foundation

public class ItunesApiService: ItunesApiServiceProtocol {
	static let shared = ItunesApiService()
	private let baseURLString = BaseUrl()
	
	public func fetchListSongs() async -> Result<[SongDTO], ItunesApiError> {
		
		let urlString = baseURLString.urlBase + baseURLString.endPoint
		
		guard let url = URL(string: urlString) else {
			return .failure(.invalidURL)
		}
		
		do {
			let (data, _) = try await URLSession.shared.data(from: url)
			let decoder = JSONDecoder()
			let result = try decoder.decode(SongDTO.self, from: data)
			
			return .success([result])
		} catch {
			return .failure(.emptyData)
		}
	}
}
