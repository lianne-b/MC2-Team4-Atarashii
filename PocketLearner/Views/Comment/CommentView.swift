//
//  CommentView.swift
//  PocketLearner
//
//  Created by 이재원 on 2023/05/09.
//

import SwiftUI

struct CommentView: View {
    // TODO : check from db. (Was I commented)
    @State var isCommented: Bool = true
    
    let commentTextBlackColor: UIColor = #colorLiteral(red: 0.3450980186, green: 0.3450980186, blue: 0.3450980186, alpha: 1)    // #585858
    let commentBoxGrayColor: UIColor = #colorLiteral(red: 0.9647058845, green: 0.9647058845, blue: 0.9647058845, alpha: 1)      // #F6F6F6
    let dividerGrayColor: UIColor = #colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)         // #D9D9D9
    
    
    let text: String = """
    칭찬글 블라블라 어쩌구 칭찬글 블라블라라라
    라라라 어쩌구 칭찬글 블라블라 어쩌구
    칭찬글 블라블라 어쩌구 칭찬글 블라블라
    어쩌구 칭찬글 블라블라 어쩌구
    """
    let text2: String = "123"

    var body: some View {
        VStack{
            Text("헤이즐, 칭찬해요!")
                .font(.system(size: 25, weight: .medium))
                .foregroundColor(.black)
                .padding(.bottom, 30)
                .padding(.top, 20)
            if isCommented {
                HStack{
                    Text("내가 남긴 칭찬")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(Color(commentTextBlackColor))
                    Spacer()
                }
                commentBox(isMine: true, nickName: nil)
                HStack{
                    Spacer()
                    Button(action: {
                        // TODO : to 수정 view
                    }){
                        Text("수정하기")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color(commentTextBlackColor))
                    }
                    Spacer()
                    Divider().frame(width: 1, height: 30)
                        .foregroundColor(Color(dividerGrayColor))
                    Spacer()
                    Button(action: {
                        // TODO : to 삭제 view
                    }){
                        Text("삭제하기")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.red)
                    }
                    Spacer()
                }.padding(.top, 10)
                Divider()
                    .frame(height: 1)
                    .foregroundColor(Color(dividerGrayColor))
                    .padding(.vertical, 10)
            }
            ScrollView(showsIndicators: false){
                ForEach(["Jeckmu", "Hazel", "Swimmer", "Lianne", "Jerry"], id: \.self) { nickName in
                        commentBox(isMine: false, nickName: nickName)
                    }
            }
            Spacer()
            Text("나도 헤이즐 칭찬하기")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .padding(.vertical, 19)
                .padding(.horizontal, 75)
                .background(
                    RoundedRectangle(cornerRadius: 100)
                        .fill(Color.black)
                )
                .padding(.top, 10)
        }.padding(.horizontal, 39)
    }
    
    func commentBox(isMine: Bool, nickName: String?) -> some View{
        return VStack(alignment: .leading){
            HStack{
                Text(text)
                    .font(.system(size: 14, weight: .regular))
                    .lineSpacing(6)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(isMine ? .white : Color(commentTextBlackColor))
                Spacer()
            }
            if !isMine{
                Spacer().frame(height: 21)
                HStack{
                    Spacer()
                    Text("From. \(nickName ?? "")")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color(commentTextBlackColor))
                }
            }
        }
        .padding(20)
        .frame(width: 314)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(isMine ? .black : Color(commentBoxGrayColor))
        )
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView().previewDevice("iPhone 14")
    }
}
