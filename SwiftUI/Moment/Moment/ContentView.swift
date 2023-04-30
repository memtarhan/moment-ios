//
//  ContentView.swift
//  Moment
//
//  Created by Mehmet Tarhan on 29/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isSideBarOpened = false

    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(0 ..< 30) { _ in
                        AsyncImage(
                            url: URL(
                                string: "https://picsum.photos/600"
                            )) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 240)
                            } placeholder: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.gray.opacity(0.6))
                                        .frame(height: 240)
                                    ProgressView()
                                }
                            }
                            .aspectRatio(3 / 2, contentMode: .fill)
                            .cornerRadius(12)
                            .padding(.vertical)
                            .shadow(radius: 4)
                    }
                    .listRowSeparator(.hidden)
                }
                .padding()
                .toolbar {
                    Button {
                        isSideBarOpened.toggle()
                    } label: {
                        Label("Toggle SideBar",
                              systemImage: "line.3.horizontal.circle.fill")
                    }
                }
                .listStyle(.inset)
                .scrollIndicators(.hidden)
                .navigationTitle("Home")
                .navigationBarTitleDisplayMode(.inline)
            }
            SideMenu(isSidebarVisible: $isSideBarOpened)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
