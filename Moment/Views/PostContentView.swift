//
//  PhotoPostView.swift
//  Moment
//
//  Created by Mehmet Tarhan on 25/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import SwiftUI

class PostContentModel: Identifiable {
    var photoURL: URL?
    var liked: Bool
    var likesCount: Int
    var bookmarked: Bool
    var bookmarksCount: Int

    init(photoURL: URL?, liked: Bool, likesCount: Int, bookmarked: Bool, bookmarksCount: Int) {
        self.photoURL = photoURL
        self.liked = liked
        self.likesCount = likesCount
        self.bookmarked = bookmarked
        self.bookmarksCount = bookmarksCount
    }
}

let defaultPostContent = PostContentModel(photoURL: URL(string: "https://images.unsplash.com/photo-1663652010269-0f9a840fc3a3"),
                                          liked: true,
                                          likesCount: 12,
                                          bookmarked: false,
                                          bookmarksCount: 2)

class PostContentViewModel: ObservableObject {
    @Published var model: PostContentModel

    @Published var liked = false
    @Published var likesCount = 0
    @Published var bookmarked = false
    @Published var bookmarksCount = 0

    init(model: PostContentModel) {
        self.model = model

        liked = model.liked
        likesCount = model.likesCount
        bookmarked = model.bookmarked
        bookmarksCount = model.bookmarksCount
    }

    func like() {
        liked = true
        likesCount += 1
    }

    func unlike() {
        liked = false
        likesCount -= 1
    }

    func bookmark() {
        bookmarked = true
        bookmarksCount += 1
    }

    func unbookmark() {
        bookmarked = false
        bookmarksCount -= 1
    }
}

struct PostContentView: View {
    @ObservedObject var viewModel: PostContentViewModel

    var body: some View {
        ZStack(alignment: .bottom) {
            AsyncImage(
                url: viewModel.model.photoURL,
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                },
                placeholder: {
                    ProgressView()
                }
            )

            HStack(spacing: 8) {
                HStack(spacing: 4) {
                    if viewModel.liked {
                        Button {
                            viewModel.unlike()
                        } label: {
                            Image(systemName: "heart.fill")
                                .font(.title)
                                .foregroundColor(.accentColor)
                        }

                    } else {
                        Button {
                            viewModel.like()
                        } label: {
                            Image(systemName: "heart")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }

                    Text("\(viewModel.likesCount)")
                        .font(.headline)
                }

                HStack(spacing: 4) {
                    if viewModel.bookmarked {
                        Button {
                            viewModel.bookmark()
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .font(.title)
                                .foregroundColor(.accentColor)
                        }

                    } else {
                        Button {
//                            viewModel.unbookmark()
                        } label: {
                            Image(systemName: "bookmark")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }

                    Text("\(viewModel.bookmarksCount)")
                        .font(.headline)
                }

                Spacer()
            }
            .padding(6)
            .background(.ultraThinMaterial)
        }
    }
}

struct PhotoPostView_Previews: PreviewProvider {
    static var previews: some View {
        PostContentView(viewModel: PostContentViewModel(model: defaultPostContent))
            .frame(width: 300, height: 450)
            .padding()
    }
}
