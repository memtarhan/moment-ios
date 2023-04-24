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

            VStack(spacing: 8) {
                HStack {
                    HStack(spacing: 4) {
                        Image("sample-profile")
                            .resizable()
                            .frame(width: geometry.size.width / 10, height: geometry.size.width / 10)
                            .clipShape(Circle())
                        Text("Username")
                            .font(.headline)
                        Spacer()
                    }
                }
                .padding(4)

                ScrollView(.horizontal) {
                    HStack {
                        PhotoPostView()
                            .frame(width: geometry.size.width)
                        PhotoPostView()
                            .frame(width: geometry.size.width)
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: LayoutMetrics.cornerRadius, style: .continuous))
                .scrollIndicators(.hidden, axes: [.vertical, .horizontal])
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
