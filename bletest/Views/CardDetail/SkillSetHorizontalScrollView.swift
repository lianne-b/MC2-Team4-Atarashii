//
//  skillSetHorizontalScrollView.swift
//  bletest
//
//  Created by 이재원 on 2023/05/08.
//

import SwiftUI

struct SkillSetHorizontalScrollView: View {
    let gaugeGrayColor: Color = Color(red: 250/255, green: 250/255, blue: 250/255)
    let radiusGrayColor: Color = Color(red: 0.6, green: 0.6, blue: 0.6)
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                skillCard()
                skillCard()
                skillCard()
                skillCard()
                skillCard()
            }
        }
    }
    
    func skillCard() -> some View {
        return ZStack{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(Color.white)
                .frame(width: 200, height: 280)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
            VStack{
                Spacer().frame(height: 20)
                Image("dummyPikachu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .offset(y: 3)
                    .padding(30)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black, lineWidth: 1))
                Text("Figma")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.vertical, 3)
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius: 200, style: .continuous)
                        .fill(gaugeGrayColor)
                        .frame(width: 160, height: 22)
                        .overlay(
                            RoundedRectangle(cornerRadius: 200, style: .continuous)
                                .stroke(radiusGrayColor, lineWidth: 1)
                        )
                    RoundedRectangle(cornerRadius: 200, style: .continuous)
                        .fill(Color.purple)
                        .frame(width: 160*0.7, height: 22)
                    Text("70%")
                        .font(.system(size: 13, weight: .bold))
                        .foregroundColor(.white)
                        .offset(x: 150*0.7 - 30)
                }
                Text("활용이 익숙하고, 팀원들에게\n지식 공유를 할 수 있어요.")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 4)
                Spacer().frame(height: 20)
            }.frame(width: 220, height: 370)
        }
    }
}

struct SkillSetHorizontalScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SkillSetHorizontalScrollView()
    }
}
