//
//  UIImage+load.swift
//  SampleOAuth
//
//  Created by Shota Fuchikami on 2021/06/26.
//

import UIKit

extension UIImage {
    static func load(url: String) -> UIImage? {
        guard let url = URL(string: url) else {
            return nil
        }
        guard let data = try? Data(contentsOf: url) else {
            return nil
        }
        return UIImage(data: data)
    }
}
