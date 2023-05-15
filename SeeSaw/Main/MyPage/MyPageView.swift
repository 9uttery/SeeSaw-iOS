//
//  MyPageView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/04/26.
//

import SwiftUI

struct MyPageView: View {
    @State private var nickname = "에몽"
    @State private var showChangeNicknameView = false
    @State private var showLogoutView = false
    
    var body: some View {
//        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        greenRectangle
                            .padding(.top, 40)
                            .padding(.bottom, 16)
                        userNicknameRow
                    }
                    .padding(.bottom, 36)
                    
                    VStack(spacing: 0) {
                        NavigationLink {
                            
                        } label: {
                            MyPageRow(isRowTop: true,
                                      title: "알림",
                                      isChevronExist: true)
                        }
                        
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            MyPageRow(isRowTop: false,
                                      title: "공지사항",
                                      isChevronExist: true)
                        }
                    }
                    .padding(.bottom, 16)
                    
                    VStack(spacing: 0) {
                        provisioningViewRow
                        
                        Divider()
                        
                        NavigationLink {
                            
                        } label: {
                            MyPageRow(isRowTop: false,
                                      title: "문의하기",
                                      isChevronExist: true)
                        }
                    }
                    .padding(.bottom, 16)
                    
                    VStack(spacing: 0) {
                        logoutViewRow
                        Divider()
                        signOutViewRow
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .background(Color.Gray200)
                
            if $showChangeNicknameView.wrappedValue {                        ChangeNicknameView(nickname: self.nickname,
                                       showChangeNicknameView: self.$showChangeNicknameView)
                }
                
                if $showLogoutView.wrappedValue {
                    LogoutView(showLogoutView: self.$showLogoutView)
                }
            }
            .navigationTitle("마이페이지")
            .navigationBarTitleDisplayMode(.inline)
//        }
    }
    
    var greenRectangle: some View {
        Rectangle()
            .frame(width: 80, height: 4)
            .foregroundColor(.SeeSawGreen)
    }
    
    var userNicknameRow: some View {
        HStack(spacing: 0) {
            HStack(spacing: 0) {
                Text(nickname)
                    .font(.ssHeading1)
                    .foregroundColor(Color.GrayBlack)
                Text("님")
                    .font(.ssHeading1)
                    .foregroundColor(Color.Gray600)
            }
            .padding(.trailing, 16)
            
            Button {
                showChangeNicknameView = true
            } label: {
                changeNicknameImage
            }
            
            Spacer()
        }
    }
    
    var changeNicknameImage: some View {
        Image("ChangeNickname")
            .frame(width: 16, height: 16)
            .foregroundColor(Color.Gray500)
    }
    
    // 마이페이지 메뉴 Views
    var provisioningViewRow: some View {
        NavigationLink {
            ProvisioningView()
        } label: {
            MyPageRow(isRowTop: true,
                      title: "권한설정",
                      isChevronExist: true)
        }
    }
    
    var logoutViewRow: some View {
        Button {
            showLogoutView = true
        } label: {
            MyPageRow(isRowTop: true,
                      title: "로그아웃",
                      isChevronExist: false)
        }
    }
    
    var signOutViewRow: some View {
        NavigationLink {
            SignOutView()
        } label: {
            MyPageRow(isRowTop: false,
                      title: "회원탈퇴",
                      isChevronExist: true)
        }
    }
}

 struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
 }
