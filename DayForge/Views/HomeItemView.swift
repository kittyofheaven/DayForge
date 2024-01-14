//
//  HomeItemView.swift
//  DayForge
//
//  Created by Hana Azizah on 15/01/24.
//

import SwiftUI

struct HomeItemView: View {
//    @StateObject var viewModel = HomeItemViewModel()
    var body: some View {
        HStack() {
            
            VStack {
                Text("coba")
            }
            .padding(.leading, 35)
            .foregroundStyle(Color.black)
            
            VStack(alignment: .leading) {
                Text("cobajuga")
                
                Spacer()
                
            }
            .padding(.top)
            .padding(.leading, 35)
            
            Spacer()
        }
        .frame(height: 150)
        .background {
            HStack(spacing: 0){
                Rectangle()
                    .cornerRadius(10, corners: [.topLeft, .bottomLeft])
                    .foregroundStyle(Color.white)
                    .frame(width: 95)
                    .shadow(radius: 20, x: 0, y: 10)
                Rectangle()
                    .cornerRadius(10, corners: [.topRight, .bottomRight])
                    .foregroundStyle(Color.gray)
                    .opacity(0.5)
                    .shadow(radius: 20, x: 0, y: 20)
            }
            .frame(height: 150)
        }
        
    }
}


#Preview {
    HomeItemView()
}
