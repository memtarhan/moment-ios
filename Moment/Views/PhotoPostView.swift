//
//  PhotoPostView.swift
//  Moment
//
//  Created by Mehmet Tarhan on 25/04/2023.
//  Copyright © 2023 MEMTARHAN. All rights reserved.
//

import SwiftUI

struct PhotoPostView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("sample")
                .resizable()
            
            HStack(spacing: 8) {
                HStack(spacing: 4) {
                    Image(systemName: "heart.fill")
                        .font(.title)
                        .foregroundColor(.accentColor)
                    Text("100")
                        .font(.headline)
                }
                HStack(spacing: 4) {
                    Image(systemName: "bookmark")
                        .font(.title)
                        .foregroundColor(.white)
                    Text("100")
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
        PhotoPostView()
    }
}
