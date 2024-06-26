//
//  ItunesProject_SwiftUIApp.swift
//  ItunesProject-SwiftUI
//
//  Created by Natacha Saldaña on 02-04-24.
//

import SwiftUI

@main
struct ItunesProject_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
			let viewModel = ItunesMusicViewModel(getListUseCase: GetListSongsUseCase(repository: ItunesRepository(dataSource: ItunesApiService.shared)))
			ContentView(viewModel: viewModel)
        }
    }
}
