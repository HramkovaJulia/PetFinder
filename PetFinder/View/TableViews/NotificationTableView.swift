//
//  NotificationTableView.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 25.12.23.
//

import UIKit

class NotificationTableView: UITableView {
    
    let notificationsMassive = [
        NotificationModel(notificationLabel: "Новый отклик на вашем объявлении", notificationMessage: "Здравствуйте, видела вашего питомца вчера и сегодня на улице Малинина, 30. Он был вместе с бродячими собаками", notificationDate: "Сегодня 18:30"),
        NotificationModel(notificationLabel: "Ваша подписка истекает", notificationMessage: "Ваша подписка на PetFinder истекает через 3 дня. Чтобы продлить подписку, перейдите в раздел 'Настройки'.", notificationDate: "Вчера 10:15"),
        NotificationModel(notificationLabel: "Новая акция в PetStore", notificationMessage: "У нас сейчас проходит акция 'Скидки на корма для кошек'. Посмотрите нашу новую коллекцию кормов и получите скидку до 30%!", notificationDate: "1 неделю назад 14:20"),
        NotificationModel(notificationLabel: "Поздравляем с Днем Рождения!", notificationMessage: "PetFinder от всей души поздравляет вас с Днем Рождения! Желаем вам счастья, здоровья и много улыбок в этот особенный день!", notificationDate: "2 недели назад 09:45"),
        NotificationModel(notificationLabel: "Успешное завершение сделки", notificationMessage: "Ваш питомец нашел новый дом! Мы рады сообщить вам, что ваше объявление было успешно завершено. Спасибо, что используете PetFinder!", notificationDate: "3 недели назад 16:55"),
        NotificationModel(notificationLabel: "Отчет о видении питомца", notificationMessage: "Здравствуйте, я видел вашего питомца сегодня около парка на улице Цветочная. Он был вместе с другими собаками. Надеюсь, что эта информация поможет вам найти его!", notificationDate: "1 день назад 13:10"),
        NotificationModel(notificationLabel: "Информация о месте появления питомца", notificationMessage: "Здравствуйте, мой друг видел вашего питомца вчера возле университета на проспекте Победы. Он был вместе с детьми. Можете проверить это место, возможно, он там!", notificationDate: "2 дня назад 09:25"),
        NotificationModel(notificationLabel: "Сообщение о местонахождении питомца", notificationMessage: "Привет, я видел вашего питомца сегодня у магазина на перекрестке улицы Солнечная и Парковой. Посмотрите там, он мог остаться поблизости!", notificationDate: "3 дня назад 17:40"),
        NotificationModel(notificationLabel: "Информация о замеченном питомце", notificationMessage: "Здравствуйте, я видел вашего питомца вчера около ресторана на улице Центральной. Он был вместе с другими кошками. Надеюсь, это поможет вам его найти!", notificationDate: "1 неделю назад 12:15")
    ]

    
    init() {
        super.init(frame: .zero, style: .plain)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setup()
        self.register(NotificationTableViewCell.self, forCellReuseIdentifier: "NotificationTableViewCell")
    }
    
    private func setup() {
        self.dataSource = self
        self.delegate = self
        self.separatorStyle = .none
        self.backgroundColor = .clear
    }
}

extension NotificationTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notificationsMassive.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: NotificationTableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell") as? NotificationTableViewCell {
                 cell = reuseCell
             } else {
                 cell = NotificationTableViewCell()
             }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: NotificationTableViewCell, for indexPath: IndexPath) -> UITableViewCell {
        cell.setup(data: notificationsMassive[indexPath.row])
        return cell
    }
}

extension NotificationTableView: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 117
//    }
}

