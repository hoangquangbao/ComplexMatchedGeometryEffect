//
//  Home.swift
//  ComplexMatchedGeometryEffect
//
//  Created by Quang Bao on 05/06/2022.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(profile) { profile in
                        RowView(profile: profile)
                    }
                }
            }
            .navigationTitle("WhatApp")
        }
    }
    
    //MARK: Profile Row View
    @ViewBuilder
    func RowView(profile: Profile) -> some View {
        HStack(spacing: 20) {
            VStack {
                    Image(profile.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
            }
            
            VStack(alignment: .leading, spacing: 6) {
                Text(profile.username)
                    .bold()
                    .font(.callout)
                
                Text(profile.lastMsg)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(profile.lastActive)
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
