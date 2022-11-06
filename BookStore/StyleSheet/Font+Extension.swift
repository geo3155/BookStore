//
//  Font+Extension.swift
//  BookStore
//
//  Created by George Predan on 04.11.2022.
//

import Foundation
import SwiftUI

fileprivate enum MainFontName: String {
    
    case bold = "IBMPlexSans-Bold.ttf"
    case medium = "IBMPlexSans-Medium.ttf"
    case regular = "IBMPlexSans-Regular.ttf"
}

extension Font {
    
    struct Main {
        static func bold(size: CGFloat = 18) -> Font {
            Font.custom(MainFontName.bold.rawValue, size: size)
        }
        static func medium(size: CGFloat = 18) -> Font {
            Font.custom(MainFontName.medium.rawValue, size: size)
        }
        static func regular(size: CGFloat = 18) -> Font {
            Font.custom(MainFontName.regular.rawValue, size: size)
        }
        
        static var h1Bold: Font {
            bold(size: 20)
        }
    }
    
}
