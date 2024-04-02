//
//  ContentView.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var viewModel: ItunesMusicViewModel
	
	var body: some View {
		TabView {
			ItunesScreen(viewModel: viewModel)
				.tabItem {
					Label("Music", systemImage: "music.note")
				}
			FavoritesView(viewModel: viewModel)
				.tabItem {
					Label("Favorites", systemImage: "star.fill")
				}
			CountryListView(viewModel: viewModel)
				.tabItem {
					Label("Countries", systemImage: "flag")
				}
		}
	}
}
