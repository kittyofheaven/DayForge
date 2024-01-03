//
//  HeadingView.swift
//  DayForge
//
//  Created by Hana Azizah on 03/01/24.
//

import SwiftUI

struct HeadingView: View {
    var body: some View {
        Text("DAY.FORGE")
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.custom("PaytoneOne-Regular", size: 55))
        
        
        Text("Forge Your Path, Chronicle Your Journey Daily")
            .opacity(0.5)
            .font(.custom("Roboto-Regular", size: 16))
    }
}

#Preview {
    HeadingView()
}
