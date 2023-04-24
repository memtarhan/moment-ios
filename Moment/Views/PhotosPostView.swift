//
//  PhotosPostView.swift
//  Moment
//
//  Created by Mehmet Tarhan on 24/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import SwiftUI

struct PhotosPostView: View {
    var body: some View {
        GeometryReader { geometry in

            VStack(spacing: 4) {
                HStack {
                    HStack(spacing: 4) {
                        Image("sample-profile")
                            .resizable()
                            .frame(width: geometry.size.width / 7, height: geometry.size.width / 7)
                            .clipShape(Circle())
                        Text("Username")
                            .font(.headline)
                        Spacer()
                    }
                }
                .padding()

                ScrollView(.horizontal) {
                    HStack {
                        Image("sample")
                            .resizable()
                            .frame(width: geometry.size.width)
                        Image("sample")
                            .resizable()
                            .frame(width: geometry.size.width)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: LayoutMetrics.cornerRadius, style: .continuous))
                .scrollIndicators(.hidden, axes: [.vertical, .horizontal])

                HStack(spacing: 8) {
                    HStack(spacing: 4) {
                        Image(systemName: "heart.fill")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                        Text("100")
                            .font(.caption)
                    }
                    HStack(spacing: 4) {
                        Image(systemName: "bookmark.fill")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                        Text("100")
                            .font(.caption)
                    }

                    Spacer()

                    Text("Date")
                        .font(.footnote)
                }
                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PhotosPostView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosPostView()
    }
}
