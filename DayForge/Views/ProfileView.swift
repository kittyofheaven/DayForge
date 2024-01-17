//
//  ProfileView.swift
//  DayForge
//
//  Created by Hana Azizah on 04/01/24.
//

import SwiftUI

struct ProfileView: View {
    @AppStorage("uid") var userID: String = ""
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            if let userNow = viewModel.userNow {
                HStack {
                    Image("DefaultProfile")
                        .resizable()
                        .frame(width: 118, height: 118)
                    VStack(alignment: .leading) {
                        Text(userNow.name)
                            .font(.custom("Poppins-Bold", size: 24))
                        Text(userNow.email)
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundStyle(.black)
                    }
                    Spacer()
                }
                .padding()
                
                Form {
                    Link(destination: URL(string: "https://github.com/kittyofheaven/DayForge")!, label: {        HStack {
                            Image(systemName: "questionmark.circle")
                                .foregroundColor(.black)
                            Text("Help")
                                .foregroundColor(.black)
                            Spacer()
                        }
                    })
                    Button {
                        
                        withAnimation {
                            viewModel.signOut()
                        }
                        
                    } label: {
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .foregroundColor(.red)
                            Text("Log Out")
                                .foregroundColor(.red)
                            Spacer()
                        }
                    }
                }
                
                Spacer()
            } else {
                Text("Loading...")
            }
        }
    }
}

//#Preview {
//    ProfileView()
//}
