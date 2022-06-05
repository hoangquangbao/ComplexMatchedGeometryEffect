//
//  Profile.swift
//  ComplexMatchedGeometryEffect
//
//  Created by Quang Bao on 05/06/2022.
//

import SwiftUI

//MARK: Profile Model and Sample Data
struct Profile: Identifiable {
    var id = UUID().uuidString
    var username: String
    var profilePicture: String
    var lastMsg: String
    var lastActive: String
}

var profile = [
    Profile(username: "Hoang Huy", profilePicture: "HoangHuy_ProfilePicture", lastMsg: "Hi!", lastActive: "10:25 AM"),
    Profile(username: "Ha Luu", profilePicture: "HaLuu_ProfilePicture", lastMsg: "Dieu Phap Lien Hoa", lastActive: "11:36 PM"),
    Profile(username: "Hoang Hieu", profilePicture: "HoangHieu_ProfilePicture", lastMsg: "Computer", lastActive: "05:30 AM"),
    Profile(username: "Ngoc Tuy", profilePicture: "NgocTuy_ProfilePicture", lastMsg: "Tran Mao", lastActive: "17:46 PM"),
    Profile(username: "Van Tren", profilePicture: "VanTren_ProfilePicture", lastMsg: "Nui Rung", lastActive: "09:23 AM"),
    Profile(username: "Quang Bao", profilePicture: "QuangBao_ProfilePicture", lastMsg: "iOS", lastActive: "06:30 AM")
]
