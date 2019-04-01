//
//  RoundedTextView.swift
//  TsaChat1819
//
//  Created by Clary Morla Gomez on 23/02/2019.
//  Copyright © 2019 Marro Gros Gabriel. All rights reserved.
//

import Foundation
import UIKit

class RoundedTextCorners: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
    }
}
