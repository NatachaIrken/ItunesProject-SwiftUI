//
//  SongDTO.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import Foundation

public struct SongDTO: Codable {
	public let resultCount: Int
	public let results: [SongListDTO]
}

public struct SongListDTO: Codable, Identifiable {
	public let wrapperType: String?
	public let kind: String?
	public let artistID, collectionID: Int?
	public let id: Int?
	public let artistName, collectionName, trackName: String?
	public let artistViewURL, collectionViewURL, trackViewURL: String?
	public let previewURL: String?
	public let artworkUrl30, artworkUrl60, artworkUrl100: String?
	public let collectionPrice, trackPrice: Double?
	public let releaseDate: String?
	public let trackCount, trackNumber: Int?
	public let trackTimeMillis: Int?
	public let country: String?
	public let currency: String?
	public let primaryGenreName: String?
	public let isStreamable: Bool?
	public let collectionArtistName: String?
	
	enum CodingKeys: String, CodingKey {
		case wrapperType, kind
		case artistID = "artistId"
		case collectionID = "collectionId"
		case id = "trackId"
		case artistName, collectionName, trackName
		case artistViewURL = "artistViewUrl"
		case collectionViewURL = "collectionViewUrl"
		case trackViewURL = "trackViewUrl"
		case previewURL = "previewUrl"
		case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice, releaseDate, trackCount, trackNumber, trackTimeMillis, country, currency, primaryGenreName, isStreamable, collectionArtistName
	}
}
