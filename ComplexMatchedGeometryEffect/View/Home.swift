//
//  Home.swift
//  ComplexMatchedGeometryEffect
//
//  Created by Quang Bao on 05/06/2022.
//

import SwiftUI

struct Home: View {
    
    //MARK: Animation Properties
    @Namespace var animation
    @State var isExpanded: Bool = false
    @State var expandedProfile: Profile?
    
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
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .overlay{
            if let expandedProfile = expandedProfile,isExpanded {
                ExpandedView(profile: expandedProfile)
            }
        }
    }
    
    //MARK: Profile Row View
    @ViewBuilder
    func RowView(profile: Profile) -> some View {
        HStack(spacing: 20) {
            VStack {
                if expandedProfile?.id == profile.id && isExpanded {
                    Image(profile.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                        .opacity(0)
                } else {
                    Image(profile.profilePicture)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45, height: 45)
                        .clipShape(Circle())
                        .matchedGeometryEffect(id: profile.id, in: animation)
                }
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 4)) {
                    isExpanded = true
                    expandedProfile = profile
                }
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
    
    //MARK: Expanded View
    @ViewBuilder
    func ExpandedView(profile: Profile) -> some View {
        VStack {
            GeometryReader { proxy in
                let size = proxy.size
                
                Image(profile.profilePicture)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//1.                    .matchedGeometryEffect(id: profile.id, in: animation)
                    .frame(width: size.width, height: size.height)
                //1. IF WE USE CLIP IT WILL CLIP IMAGE FROM TRANSITION
                    .clipped()
                //2. IF WE USE AFTER CLIP IT WILL UN POSITION THE VIEW
//2.                    .matchedGeometryEffect(id: profile.id, in: animation)
            }
            //3. WORKAROUND WRAP IT INSIDE GEOMETRY READER AND APPLY BEFORE FRAME
            //3.
            .matchedGeometryEffect(id: profile.id, in: animation)
            .frame(height: 300)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
