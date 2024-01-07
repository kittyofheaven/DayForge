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
                    Button {
                        // settings
                    } label: {
                        HStack {
                            Image(systemName: "gear")
                            Text("Settings")
                            Spacer()
                            Image(systemName: "line.diagonal.arrow")
                        }
                    }
                    Button {
                        // help
                    } label: {
                        HStack {
                            Image(systemName: "questionmark.circle")
                            Text("Help")
                            Spacer()
                            Image(systemName: "line.diagonal.arrow")
                        }
                    }
                    Button {
                        
                        withAnimation {
                            viewModel.signOut()
                        }
                        
                    } label: {
                        HStack {
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                .foregroundStyle(Color.red)
                            Text("Log Out")
                                .foregroundStyle(Color.red)
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
