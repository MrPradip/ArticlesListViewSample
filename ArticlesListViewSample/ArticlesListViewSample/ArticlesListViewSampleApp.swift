//
//  ArticlesListViewSampleApp.swift
//  ArticlesListViewSample
//
//  Created by Pradip Kumar on 04/03/25.
//

import SwiftUI

@main
struct ArticlesListViewSampleApp: App {
    var body: some Scene {
        WindowGroup {
            //ArticleListView() // API call > It will work once correct Production API key is added
            ArticleListLocalView() // JSOn File Call
        }
    }
}
