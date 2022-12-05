//
//  ContentView.swift
//  watchOS
//
//  Created by Weiss, Alexander on 27.11.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationStack {
			List(1..<51) {
				Text("\($0)")
			}
			.listStyle(.carousel)
			.navigationTitle("watchOS App")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
