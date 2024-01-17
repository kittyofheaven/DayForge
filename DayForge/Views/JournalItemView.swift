//
//  JournalItemView.swift
//  DayForge
//
//  Created by Hana Azizah on 09/01/24.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct JournalItemView: View {
    @StateObject var viewModel = JournalItemViewModel()
    
    let item: Journal
    var body: some View {
        HStack() {
            
            VStack {
                Text(viewModel.unixToDate(unixTime: item.updated)[0])
                    .font(.custom("Poppins-Bold", size: 20))
                Text(viewModel.unixToDate(unixTime: item.updated)[1])
                    .font(.custom("Poppins-Regular", size: 16))
            }
            .padding(.leading, 35)
            .foregroundStyle(Color.black)
            
            
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.custom("Poppins-Regular", size: 20))
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.leading)
                Text(item.content.count < 50 ? item.content.prefix(50) : item.content.prefix(50) + " ...")
                    .font(.custom("Poppins-Regular", size: 14))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
                
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
                    .foregroundColor({
                                    switch item.mentalIssuesFlag {
                                    case "negative":
                                        return Color.red
                                    case "positive":
                                        return Color.yellow
                                    default:
                                        return Color.gray
                                    }
                                }())
                    .opacity(0.5)
                    .shadow(radius: 20, x: 0, y: 20)
            }
            .frame(height: 150)
        }
        
    }
}

#Preview {
    JournalItemView(item: .init(id: "id", uid: "uid", title: "title", content: "content lorem ipsum dolor sit amet wipe my ass you bitch", mentalIssuesFlag: "negative", updated: 1704906995.637922))
}
