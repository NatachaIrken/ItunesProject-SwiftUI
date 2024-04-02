//
//  ItunesScreen.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import SwiftUI

struct ItunesScreen: View {
	
	@ObservedObject var viewModel: ItunesMusicViewModel
	@State private var selectedSong: Song? = nil
	
	init(viewModel: ItunesMusicViewModel) {
		self.viewModel = viewModel
	}
	
	var body: some View {
		VStack {
			Text("iTunes Music")
				.font(.largeTitle)
				.padding(.top, 20)
						
			List(viewModel.songs, id: \.id) { song in
				HStack {
					Button(action: {
						selectedSong = song
					}) {
						Text("Artist: \(song.artistName), Country: \(song.country)")
					}
					Spacer()
					if viewModel.isFavorite(song: song) {
						Image(systemName: "star.fill")
							.foregroundColor(.yellow)
							.onTapGesture {
								viewModel.removeFavorite(song: song)
							}
					} else {
						Image(systemName: "star")
							.onTapGesture {
								viewModel.addFavorite(song: song)
							}
					}
				}
			}
			.listStyle(PlainListStyle())
		}
		.sheet(item: $selectedSong) { song in
			ArtistInfoView(song: song)
		}
		.task {
			await viewModel.fetchSongs()
		}
		
	}
}

struct ArtistInfoView: View {
	var song: Song
	
	var body: some View {
		VStack {
			Text("Artist: \(song.artistName)")
			Text("Country: \(song.country)")
			Text("\(song.collectionName)")
			if let url = URL(string: song.artworkUrl100) {
				AsyncImage(url: url) { image in
					image.resizable()
						.aspectRatio(contentMode: .fit)
				} placeholder: {
					ProgressView()
				}
				.frame(width: 200, height: 200)
				.cornerRadius(10)
			} else {
				Text("URL de imagen no válida")
			}
		}
		.padding()
	}
}

struct FavoritesView: View {
	@ObservedObject var viewModel: ItunesMusicViewModel
	
	
	var body: some View {
		VStack {
			List(viewModel.favorites.sorted(by: { $0.artistName < $1.artistName }), id: \.id) { song in
				Text("Artist: \(song.artistName), Country: \(song.country)")
			}
			.listStyle(PlainListStyle())
		}
	}
}

struct CountryListView: View {
	
	let countries = ["Chile", "Suecia", "Estados Unidos"]
	
	@State private var selectedCountry: IdentifiableString? = nil
	
	@ObservedObject var viewModel: ItunesMusicViewModel
	
	var body: some View {
		
		List(countries, id: \.self) { country in
			Button(action: {
				selectedCountry = IdentifiableString(value: country)
			}) {
				Text(country)
			}
		}
		
		.listStyle(PlainListStyle())
		.sheet(item: $selectedCountry) { identifiableCountry in
			let country = identifiableCountry.value
			let countrySongs = Set(viewModel.songs.filter { $0.country == country })
			CountrySongsView(songs: Array(countrySongs))
		}	}
}

struct CountrySongsView: View {
	let songs: [Song]
	
	var body: some View {
		VStack {
			Text("Songs from \(songs.first?.country ?? "")")
				.font(.title)
				.padding()
			
			List(songs, id: \.id) { song in
				Text(song.trackName)
			}
		}
	}
}
