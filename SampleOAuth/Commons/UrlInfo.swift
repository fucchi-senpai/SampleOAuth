//
//  UrlInfo.swift
//  SampleOAuth
//
//  Created by Shota Fuchikami on 2021/06/26.
//

import Foundation

enum WebViewUrlType {
    case oauth
    case open
}

struct UrlInfo {
    var url: String
    var type: WebViewUrlType
}
