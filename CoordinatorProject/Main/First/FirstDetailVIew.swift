//
//  FirstDetailVIew.swift
//  CoordinatorProject
//
//  Created by Daniil Kulikovskiy on 3/13/24.
//

import SwiftUI

struct FirstDetailVIew: View {
    
    @ObservedObject var vm: FirstTabViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("First Detail")
            TextField("Enter you name", text: $vm.name)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
            
            TextField("Enter you email", text: $vm.email)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    FirstDetailVIew(vm: FirstTabViewModel())
}
