//
//  Params.swift
//  MyScoreBoardapp
//
//  Created by MBPrDyson on 4/18/16.
//  Copyright © 2016 PiHan Hsu. All rights reserved.
//

import Foundation

struct Params {
    static let PersonalMainPageTitle = "Score Team"
    static let emailReg = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    static let passwordReg = "[A-Z0-9a-z._%+-]{8,}"
    static let apiRootPath = "http://product.myscoreboardapp.com/api/v1/"
    static let apiLogin = "login"
    static let apiLogout = "logout"
    static let apiSignup = "signup"
}


enum ButtonType {
    case FBLogin
    case ApiLogin
}

enum TextFieldType {
    case Password
    case Account
    case Email
    case UserId
    case NickName
    case Gender
}