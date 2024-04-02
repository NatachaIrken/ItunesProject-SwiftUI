//
//  ItunesApiError.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import Foundation

public enum ItunesApiError: Error, CustomStringConvertible {
	case invalidURL
	case networkError(URLError?)
	case badResponse(Int)
	case decoding(DecodingError?)
	case emptyData
	case unknown
	
	public var description: String {
		switch self {
		case .invalidURL:
			return "Bad URL"
		case .networkError(let error):
			return "URL Session Error: \(error?.localizedDescription ?? "Unknown")"
		case .badResponse(let statusCode):
			return "Bad Response with Status Code: \(statusCode)"
		case .decoding(let decodingError):
			return "Decoding Error: \(decodingError?.localizedDescription ?? "Unknown")"
		case .emptyData:
			return "Empty Data"
		case .unknown:
			return "Unknown Error"
		}
	}
	
	var localizedDescription: String {
		switch self {
		case .invalidURL, .unknown:
			return "Something went wrong"
		case .networkError(let error):
			return error?.localizedDescription ?? "Something went wrong"
		case .badResponse(_):
			return "Something went wrong"
		case .decoding(let decodingError):
			return decodingError?.localizedDescription ?? "Decoding error"
		case .emptyData:
			return "Empty data"
		}
	}
}
