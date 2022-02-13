//
//  ContentView.swift
//  Memorize
//
//  Created by Young Soo Hwang on 2022/02/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 20)
                .padding(.horizontal)
            Text("Hello")
                .foregroundColor(.yellow)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
