//
//  CountryManager.swift
//  PetFinder
//
//  Created by Алексей Шамрей on 14.02.24.
//

import Foundation


struct CountryManager {
    let country = [
        ["AD", "Андорра"],
        ["AE", "Объединенные Арабские Эмираты"],
        ["AF", "Афганистан"],
        ["AG", "Антигуа и Барбуда"],
        ["AI", "Ангилья"],
        ["AL", "Албания"],
        ["AM", "Армения"],
        ["AO", "Ангола"],
        ["AR", "Аргентина"],
        ["AS", "Американское Самоа"],
        ["AT", "Австрия"],
        ["AU", "Австралия"],
        ["AW", "Аруба"],
        ["AX", "Аландские острова"],
        ["AZ", "Азербайджан"],
        ["BA", "Босния и Герцеговина"],
        ["BB", "Барбадос"],
        ["BD", "Бангладеш"],
        ["BE", "Бельгия"],
        ["BF", "Буркина-Фасо"],
        ["BG", "Болгария"],
        ["BH", "Бахрейн"],
        ["BI", "Бурунди"],
        ["BJ", "Бенин"],
        ["BL", "Сен-Бартелеми"],
        ["BM", "Бермудские острова"],
        ["BN", "Бруней"],
        ["BO", "Боливия"],
        ["BR", "Бразилия"],
        ["BS", "Багамы"],
        ["BT", "Бутан"],
        ["BV", "Остров Буве"],
        ["BW", "Ботсвана"],
        ["BY", "Беларусь"],
        ["BZ", "Белиз"],
        ["CA", "Канада"],
        ["CC", "Кокосовые (Килинг) острова"],
        ["CD", "Конго - Киншаса"],
        ["CF", "Центральноафриканская Республика"],
        ["CG", "Конго - Браззавиль"],
        ["CH", "Швейцария"],
        ["CI", "Кот-д'Ивуар"],
        ["CK", "Острова Кука"],
        ["CL", "Чили"],
        ["CM", "Камерун"],
        ["CN", "Китай"],
        ["CO", "Колумбия"],
        ["CR", "Коста-Рика"],
        ["CU", "Куба"],
        ["CV", "Кабо-Верде"],
        ["CW", "Кюрасао"],
        ["CX", "Остров Рождества"],
        ["CY", "Кипр"],
        ["CZ", "Чешская Республика"],
        ["DE", "Германия"],
        ["DJ", "Джибути"],
        ["DK", "Дания"],
        ["DM", "Доминика"],
        ["DO", "Доминиканская Республика"],
        ["DZ", "Алжир"],
        ["EC", "Эквадор"],
        ["EE", "Эстония"],
        ["EG", "Египет"],
        ["ER", "Эритрея"],
        ["ES", "Испания"],
        ["ET", "Эфиопия"],
        ["EU", "Европейский Союз"],
        ["FI", "Финляндия"],
        ["FJ", "Фиджи"],
        ["FK", "Фолклендские острова"],
        ["FM", "Микронезия"],
        ["FO", "Фарерские острова"],
        ["FR", "Франция"],
        ["GA", "Габон"],
        ["GB", "Великобритания"],
        ["GB-ENG", "Англия"],
        ["GB-NIR", "Северная Ирландия"],
        ["GB-SCT", "Шотландия"],
        ["GB-WLS", "Уэльс"],
        ["GB-ZET", "Шетландские острова"],
        ["GD", "Гренада"],
        ["GE", "Грузия"],
        ["GF", "Французская Гвиана"],
        ["GG", "Гернси"],
        ["GH", "Гана"],
        ["GI", "Гибралтар"],
        ["GL", "Гренландия"],
        ["GM", "Гамбия"],
        ["GN", "Гвинея"],
        ["GP", "Гваделупа"],
        ["GQ", "Экваториальная Гвинея"],
        ["GR", "Греция"],
        ["GS", "Со. Джорджия и Со. Сандвичевы острова"],
        ["GT", "Гватемала"],
        ["GU", "Гуам"],
        ["GW", "Гвинея-Бисау"],
        ["GY", "Гайана"],
        ["HK", "Гонконг (Китай)"],
        ["HM", "Острова Херд и Макдональд"],
        ["HN", "Гондурас"], ["HN", "Гондурас"],
        ["HR", "Хорватия"],
        ["HT", "Гаити"],
        ["HU", "Венгрия"],
        ["ID", "Индонезия"],
        ["IE", "Ирландия"],
        ["IL", "Израиль"],
        ["IM", "Остров Мэн"],
        ["IN", "Индия"],
        ["IO", "Британская территория в Индийском океане"],
        ["IQ", "Ирак"],
        ["IR", "Иран"],
        ["IS", "Исландия"],
        ["IT", "Италия"],
        ["JE", "Джерси"],
        ["JM", "Ямайка"],
        ["JO", "Иордания"],
        ["JP", "Япония"],
        ["KE", "Кения"],
        ["KG", "Кыргызстан"],
        ["KH", "Камбоджа"],
        ["KI", "Кирибати"],
        ["KM", "Коморские острова"],
        ["KN", "Сент-Китс и Невис"],
        ["KP", "Северная Корея"],
        ["KR", "Южная Корея"],
        ["KW", "Кувейт"],
        ["KY", "Каймановы острова"],
        ["KZ", "Казахстан"],
        ["LA", "Лаос"],
        ["LB", "Ливан"],
        ["LC", "Сент-Люсия"],
        ["ЛГБТ", "Прайд"],
        ["LI", "Лихтенштейн"],
        ["LK", "Шри-Ланка"],
        ["LR", "Либерия"],
        ["LS", "Лесото"],
        ["LT", "Литва"],
        ["LU", "Люксембург"],
        ["LV", "Латвия"],
        ["LY", "Ливия"],
        ["MA", "Марокко"],
        ["MC", "Монако"],
        ["MD", "Молдова"],
        ["ME", "Черногория"],
        ["MF", "Сент-Мартин"],
        ["MG", "Мадагаскар"],
        ["MH", "Маршалловы острова"],
        ["MK", "Македония"],
        ["ML", "Мали"],
        ["MM", "Мьянма (Бирма)"],
        ["MN", "Монголия"],
        ["MO", "Макао (Китай)"],
        ["MP", "Северные Марианские острова"],
        ["MQ", "Мартиника"],
        ["MR", "Мавритания"],
        ["MS", "Монтсеррат"],
        ["MT", "Мальта"],
        ["MU", "Маврикий"],
        ["MV", "Мальдивы"],
        ["MW", "Малави"],
        ["MX", "Мексика"],
        ["MY", "Малайзия"],
        ["MZ", "Мозамбик"],
        ["NA", "Намибия"],
        ["NC", "Новая Каледония"],
        ["NE", "Нигер"],
        ["NF", "Остров Норфолк"],
        ["NG", "Нигерия"],
        ["NI", "Никарагуа"],
        ["NL", "Нидерланды"],
        ["NO", "Норвегия"],
        ["NP", "Непал"],
        ["NR", "Науру"],
        ["NU", "Ниуэ"],
        ["NZ", "Новая Зеландия"],
        ["OM", "Оман"],
        ["PA", "Панама"],
        ["PE", "Перу"],
        ["PF", "Французская Полинезия"],
        ["PG", "Папуа-Новая Гвинея"],
        ["PH", "Филиппины"],
        ["PK", "Пакистан"],
        ["PL", "Польша"],
        ["PM", "Сен-Пьер и Микелон"],
        ["PN", "Острова Питкэрн"],
        ["PR", "Пуэрто-Рико"],
        ["PS", "Палестинские территории"],
        ["PT", "Португалия"],
        ["PW", "Палау"],
        ["PY", "Парагвай"],
        ["QA", "Катар"],
        ["RE", "Реюньон"],
        ["RO", "Румыния"],
        ["RS", "Сербия"],
        ["RU", "Россия"],
        ["RW", "Руанда"],
        ["SA", "Саудовская Аравия"],
        ["SB", "Соломоновы острова"],
        ["SC", "Сейшельские острова"],
        ["SD", "Судан"],
        ["SE", "Швеция"],
        ["SG", "Сингапур"],
        ["SH", "Святой Елены"],
        ["SI", "Словения"],
        ["SJ", "Шпицберген и Ян-Майен"],
        ["SK", "Словакия"],
        ["SL", "Сьерра-Леоне"],
        ["SM", "Сан-Марино"],
        ["SN", "Сенегал"],
        ["SO", "Сомали"],
        ["SR", "Суринам"],
        ["SS", "Южный Судан"],
        ["ST", "Сан-Томе и Принсипи"],
        ["SV", "Сальвадор"],
        ["SX", "Синт-Мартен"],
        ["SY", "Сирия"],
        ["SZ", "Свазиленд"],
        ["TC", "Острова Теркс и Кайкос"],
        ["TD", "Чад"],
        ["TF", "Французские южные территории"],
        ["TG", "Того"],
        ["TH", "Таиланд"],
        ["TJ", "Таджикистан"],
        ["TK", "Токелау"],
        ["TL", "Тимор-Лешти"],
        ["TM", "Туркменистан"],
        ["TN", "Тунис"],
        ["TO", "Тонга"],
        ["TR", "Турция"],
        ["TT", "Тринидад и Тобаго"],
        ["TV", "Тувалу"],
        ["TW", "Тайвань"],
        ["TZ", "Танзания"],
        ["UA", "Украина"],
        ["UG", "Уганда"],
        ["UM", "U.S. Outlying Islands"],
        ["US", "Соединенные Штаты"],
        ["US-CA", "Калифорния"],
        ["UY", "Уругвай"],
        ["UZ", "Узбекистан"],
        ["VA", "Ватикан"],
        ["VC", "Сент-Винсент и Гренадины"],
        ["VE", "Венесуэла"],
        ["VG", "Британские Виргинские острова"],
        ["VI", "Виргинские острова США"], ["VI", "Виргинские острова США"],
        ["VN", "Вьетнам"],
        ["VU", "Вануату"],
        ["WF", "Уоллис и Футуна"],
        ["WS", "Самоа"],
        ["XK", "Косово"],
        ["YE", "Йемен"],
        ["YT", "Майотта"],
        ["ZA", "Южная Африка"],
        ["ZM", "Замбия"],
        ["ZW", "Зимбабве"]
    ]
}
