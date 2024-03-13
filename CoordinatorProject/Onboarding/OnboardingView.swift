//
//  OnboardingView.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import SwiftUI

struct OnboardingView: View {
    var doneRequested: () -> ()
    
    var body: some View {
        TabView {
            ScaledImageView(imageName: "friends0", tag: 0)
            ScaledImageView(imageName: "friends1", tag: 1)
            VStack {
                ScaledImageView(imageName: "friends2", tag: 2)
                Button("Done") {
                    doneRequested()
                }
                .padding(.top, 20)
                .foregroundStyle(.white.opacity(0.6))
                .font(.title)
                .bold()
            }
        }
        .tabViewStyle(.page)
        .background(.black).ignoresSafeArea(.all)
    }
}

#Preview {
    OnboardingView(doneRequested: { })
}

