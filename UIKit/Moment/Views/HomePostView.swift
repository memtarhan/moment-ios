//
//  PhotosPostView.swift
//  Moment
//
//  Created by Mehmet Tarhan on 24/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import SwiftUI

class HomePostViewModel: ObservableObject {
    @Published var username = "memtarhan"
    @Published var photoURL = URL(string: "https://images.unsplash.com/photo-1682193964208-242fe33b2594")
    @Published var models = [defaultPostContent]
}

struct HomePostView: View {
    @ObservedObject var viewModel: HomePostViewModel

    var body: some View {
        GeometryReader { geometry in

            VStack(spacing: 8) {
                HStack {
                    HStack(spacing: 4) {
                        AsyncImage(url: viewModel.photoURL)
                            .frame(width: geometry.size.width / 10, height: geometry.size.width / 10)
                            .clipShape(Circle())
                        Text(viewModel.username)
                            .font(.headline)
                        Spacer()
                    }
                }
                .padding(4)

                ScrollView(.horizontal) {
                    LazyHStack {
                        PostContentView(viewModel: PostContentViewModel(model: defaultPostContent))
                            .frame(width: geometry.size.width)
                        PostContentView(viewModel: PostContentViewModel(model: defaultPostContent))
                            .frame(width: geometry.size.width)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: LayoutMetrics.cornerRadius, style: .continuous))
                .scrollIndicators(.hidden, axes: [.vertical, .horizontal])
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PhotosPostView_Previews: PreviewProvider {
    static var previews: some View {
        HomePostView(viewModel: HomePostViewModel())
            .padding()
            .frame(width: 360, height: 450)
    }
}
