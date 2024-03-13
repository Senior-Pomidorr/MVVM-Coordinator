//
//  Helper.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import SwiftUI

struct ScaledImageView: View {
    var imageName: String
    var tag: Int
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .tag(tag)
    }
}

