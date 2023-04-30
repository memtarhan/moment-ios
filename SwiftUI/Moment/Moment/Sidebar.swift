//
//  Sidebar.swift
//  Moment
//
//  Created by Mehmet Tarhan on 30/04/2023.
//

import SwiftUI



struct SideMenu: View {
    @Binding var isSidebarVisible: Bool

    var body: some View {
        ZStack(alignment: .center) {
            GeometryReader { _ in
                EmptyView()
            }
            .background(.black.opacity(0.3))
            .opacity(isSidebarVisible ? 1 : 0)
            .animation(.easeInOut.delay(0.1), value: isSidebarVisible)
            .onTapGesture {
                isSidebarVisible.toggle()
            }

            content
        }
        //        .padding()
        .ignoresSafeArea()
    }

    var content: some View {
        GeometryReader { geometry in
            HStack(alignment: .center) {
                ZStack(alignment: .top) {
                    Color.pink.opacity(0.7)
                        .clipShape(RoundedRectangle(cornerRadius: geometry.size.width / 2))

                    //                MenuChevron

                    VStack(alignment: .center, spacing: 20) {
                        Image(systemName: "leaf.fill")
                        Image(systemName: "book.fill")
                        Image(systemName: "leaf.fill")
                        Image(systemName: "book.fill")
                        Image(systemName: "leaf.fill")
                        Image(systemName: "book.fill")
                    }
                    .font(.largeTitle)
                    //                    .padding(.top, 80)
                    .padding()
                }
                .frame(width: geometry.size.width / 5, height: geometry.size.height / 4)
                .offset(x: isSidebarVisible ? 20 : -(geometry.size.width / 5) - 20, y: 200)
                .animation(.easeInOut, value: isSidebarVisible)

                //                Spacer()
            }
        }
    }
}
