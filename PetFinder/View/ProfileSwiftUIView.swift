//
//  ProfileSwiftUIView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 11.02.24.
//

import SwiftUI

struct ProfileSwiftUIView: View {
    var body: some View {
        ZStack {
            BackgroundProfileView()
            TopUserView()
            UserImageProfileView()
        }
        .background(Color(PFAssets.background.color))
    }
}

struct BackgroundProfileView: View {
    var body: some View {
        VStack {
            TopProfileView()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.28)
                .background(Color(PFAssets.darkBeige.color))
            Spacer()
            Spacer()
        }
    }
}

struct TopProfileView: View {
    var body: some View {
        VStack {}
    }
}



struct TopUserView: View {
    var body: some View {
        VStack(spacing: 24) {
            UserInfoProfileView()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 255)
                .background(Color(PFAssets.white.color))
                .cornerRadius(16)
                .padding(.top, 148)
            SettingsProfileView()
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 156)
                .background(Color(PFAssets.white.color))
                .cornerRadius(16)
            
            Spacer()
        }
    }
}

struct UserInfoProfileView: View {
    var body: some View {
        VStack{
            Text("Иван")
                .font(.init(PFFontFamily.SFProText.medium.font(size: 18)))
                .padding(.top, 82)
            Spacer()
            HStack(spacing: 24) {
                StatisticProfileView(labelText: "Мои объявления", count: "0")
                    .background(Color(uiColor: UIColor(hex: 0xFCF4EF, alpha: 1)))
                    .cornerRadius(12)
                StatisticProfileView(labelText: "Мои\nотклики", count: "0")
                    .background(Color(uiColor: UIColor(hex: 0xFCF4EF, alpha: 1)))
                    .cornerRadius(12)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 24)
        }
    }
}

struct SettingsProfileView: View {
    var body: some View {
        VStack(spacing: 16) {
            UserSettingButton(text: "Уведомления", userImageName: "notificationProfile")
            UserSettingButton(text: "Настройки", userImageName: "settingProfile")
            UserSettingButton(text: "Выход", userImageName: "exitProfile")
        }
        .frame(width: UIScreen.main.bounds.width * 0.9)
    }
}

struct StatisticProfileView: View {
    @State var labelText: String
    @State var count: String
    var body: some View {
        VStack {
            Text(labelText)
                .font(.init(PFFontFamily.SFProText.regular.font(size: 16)))
                .foregroundColor(Color(PFAssets.red.color))
                .multilineTextAlignment(.center)
                .padding(.top, 10)
                .padding(.horizontal, 5)
               
            Divider()
                .padding(.horizontal, 10)
                .foregroundColor(Color(PFAssets.darkBeige.color))
                
            Text(count)
                .font(.init(PFFontFamily.SFProText.semibold.font(size: 20)))
                .foregroundColor(Color(PFAssets.red.color))
                .padding(.bottom, 10)
        }
    }
}

struct UserImageProfileView: View {
    var body: some View {
        VStack {
            Image(uiImage: PFAssets.userImage.image)
                .padding(.top, 71)
            Spacer()
        }
    }
}

struct UserSettingButton: View {
    @State var text: String
    @State var userImageName: String
    var body: some View {
        HStack {
            if userImageName == "notificationProfile" {
                Image(uiImage: PFAssets.notificationProfile.image)
                    .padding(.leading, 20)
            } else if userImageName == "settingProfile"{
                Image(uiImage: PFAssets.settingsProfile.image)
                    .padding(.leading, 20)
                    .padding(.trailing, 14)
            } else {
                Image(uiImage: PFAssets.exitProfile.image)
                    .padding(.leading, 20)
                    .padding(.trailing, 14)
            }
            
            Text(text)
                .font(.init(PFFontFamily.SFProText.regular.font(size: 20)))
            Spacer()
        }
        
    }
}

#Preview {
    ProfileSwiftUIView()
}
