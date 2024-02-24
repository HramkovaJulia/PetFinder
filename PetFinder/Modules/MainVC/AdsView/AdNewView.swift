//
//  AdView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 24.02.24.
//

import SwiftUI
import WrappingHStack

struct AdNewView: View {
    private var massivePet: [LostPetCard] = [
        LostPetCard(petName: "Джек", petType: .dog, adType: .lost, createPost: "Сегодня, 12:33", breed: "Хаски", color: "Серый", age: 2, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (123) 456-7890", additionalInfo: "Носит синий ошейник.", vaccinated: true, sterilised: true),
        LostPetCard(petName: "Мурка", petType: .cat, adType: .found, createPost: "Вчера, 10:13", breed: "Британская", color: "Черный", age: 5, gender: .female, lastSeenLocation: (59.9343, 30.3351), contactNumber: "+7 (987) 654-3210", additionalInfo: "В один обычный день, когда солнце ярко светило на улицах, произошло несчастье - собака по имени Бэйли исчезла. Это была веселая и игривая собака, которая всегда привносила радость и счастье в жизнь своих хозяев. Но сейчас все было иначе.Хозяева, Джон и Мэри, были в отчаянии. Они обошли все уголки своего района, обратились в местные приюты и объявили о пропаже в социальных сетях. Но нигде не было никаких следов Бэйли. Они были уверены, что собака была похищена, и их сердца были полны горя", vaccinated: false, sterilised: true),
        LostPetCard(petName: "Рики", petType: .dog, adType: .searched, createPost: "Сегодня, 00:12", breed: "Такса", color: "Рыжий", age: 3, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (555) 123-4567", additionalInfo: "Очень дружелюбный.", vaccinated: false, sterilised: true),
        LostPetCard(petName: "Кеша", petType: .bird, adType: .lost, createPost: "04.11.2023, 12:12", breed: "Ара", color: "Многоцветный", age: 10, gender: .male, lastSeenLocation: (53.9045, 27.5615), contactNumber: "+375 (29) 123-4567", additionalInfo: "Говорит на нескольких языках.", vaccinated: true, sterilised: false),
        LostPetCard(petName: "Барсик", petType: .cat, adType: .found, createPost: "Вчера, 12:23, 00:12", breed: "Мейн-кун", color: "Серый", age: 1, gender: .male, lastSeenLocation: (55.7558, 37.6176), contactNumber: "+7 (111) 222-3333", additionalInfo: "Игривый и ласковый.", vaccinated: false, sterilised: true)
    ]
    var body: some View {
        ScrollView(showsIndicators: false) {
            WrappingHStack(0..<massivePet.count, id: \.self) { data in
                AdCellView(data: massivePet[data])
                    .padding(.bottom, 16)
                Spacer()
            }
        }
    }
}

#Preview {
    AdNewView()
}
