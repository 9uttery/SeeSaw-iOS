//
//  BatteryInformationView.swift
//  SeeSaw
//
//  Created by 이안진 on 2023/05/12.
//

import SwiftUI

enum BatteryInformation {
    static let battery = """
일상에서 가치를 실천하면 충전돼요
수면시간이 알맞으면 충전돼요

수면시간이 적으면 소모돼요
너무 많이 움직이면 배터리가 소모돼요
"""
    static let recommend = """
매일매일 사소한 것이라도 좋아요!
자신의 가치를 실현해보세요

푹 자면서 피로를 회복해보세요

많이 움직인 다음 날은 조금 쉬어볼까요?
"""
}

struct BatteryInformationView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "battery.100.bolt")
                    Text("에너지 배터리는...")
                    Spacer()
                }
                .font(.ssHeading2)
                .foregroundColor(.Gray700)
                    
                Text(BatteryInformation.battery)
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray900)
            }
            .padding(.top, 60)
            .padding(.bottom, 40)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    Image(systemName: "battery.25")
                    Text("완전히 방전되지 않으려면...")
                    Spacer()
                }
                    .font(.ssHeading2)
                    .foregroundColor(.Gray700)
                Text(BatteryInformation.recommend)
                    .font(.ssBlackBody1)
                    .foregroundColor(.Gray900)
            }
            
            Spacer()
        }
        .padding(.horizontal, 20)
        .background(Color.Gray200)
        .ignoresSafeArea()
    }
}

struct BatteryInformationView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryInformationView()
    }
}
