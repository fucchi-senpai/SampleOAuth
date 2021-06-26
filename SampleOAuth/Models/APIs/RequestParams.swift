//
//  RequestParams.swift
//  SampleOAuth
//
//  Created by Shota Fuchikami on 2021/06/26.
//

import Foundation

struct Params: Decodable {
    var githubClientId: String
    var githubClientSecrets: String
}
