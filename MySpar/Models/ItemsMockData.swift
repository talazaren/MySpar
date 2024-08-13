//
//  ItemsMockData.swift
//  MySpar
//
//  Created by Tatiana Lazarenko on 8/11/24.
//

import Foundation

struct ItemsMockData {
    var items: [Item] = [
        Item(
            title: "сыр Ламбер 500/0 230г",
            cost: 99.90,
            discount: nil,
            image: "Item1",
            accessory: .hitPrices,
            scores: [3, 5, 4, 2],
            country: nil,
            type: .pieces,
            reviews: nil
        ),
        Item(
            title: "Энергетический Напиток",
            cost: 9569.90,
            discount: nil,
            image: "Item2",
            accessory: nil,
            scores: [5, 5, 4, 1],
            country: nil,
            type: .pieces,
            reviews: nil
        ),
        Item(
            title: "Салат Овощной с Крабовыми Палочками",
            cost: 250.90,
            discount: nil,
            image: "Item3",
            accessory: nil,
            scores: [4, 5, 4, 4],
            country: nil,
            type: .pieces,
            reviews: nil
        ),
        Item(
            title: "Дорадо Охлажденная Непотрошеная 300-400г",
            cost: 500.90,
            discount: 0.25,
            image: "Item4",
            accessory: nil,
            scores: [3, 5, 4, 2],
            country: nil,
            type: .both,
            reviews: nil
        ),
        Item(
            title: "Ролл Маленькая Япония 216г",
            cost: 367.90,
            discount: nil,
            image: "Item5",
            accessory: .newItems,
            scores: [5, 5, 4, 2, 5, 4],
            country: nil,
            type: .pieces,
            reviews: nil
        ),
        Item(
            title: "Огурцы тепличные cадово-огородные",
            cost: 300.90,
            discount: nil,
            image: "Item6",
            accessory: .priceByCard,
            scores: [5, 5],
            country: .france,
            type: .kilograms,
            reviews: nil
        ),
        Item(
            title: "Манго Кео",
            cost: 1298.90,
            discount: 0.25,
            image: "Item7",
            accessory: .newItems,
            scores: [5, 5, 2, 1],
            country: nil,
            type: .both,
            reviews: nil
        ),
        Item(
            title: "Салат Овощной с Крабовыми Палочками",
            cost: 120.90,
            discount: nil,
            image: "Item8",
            accessory: nil,
            scores: [4, 5, 2, 4, 4],
            country: nil,
            type: .pieces,
            reviews: nil
        ),
        Item(
            title: "Салат Овощной с Крабовыми Палочками",
            cost: 1298.90,
            discount: nil,
            image: "Item9",
            accessory: nil,
            scores: [4, 5, 5, 4, 5],
            country: nil,
            type: .pieces,
            reviews: nil
        ),
        Item(
            title: "Масло Слобода Рафинированное 1,8л",
            cost: 1298.90,
            discount: nil,
            image: "Item10",
            accessory: .hitPrices,
            scores: [4, 5],
            country: nil,
            type: .pieces,
            reviews: nil
        ),
        Item(
            title: "Салат Овощной с Крабовыми Палочками",
            cost: 250,
            discount: nil,
            image: "Item11",
            accessory: nil,
            scores: [4, 5, 2, 1, 1],
            country: .france,
            type: .pieces,
            reviews: nil
        ),
        Item(
            title: "Макаронные Изделия SPAR Спагетти 450г",
            cost: 2600.90,
            discount: nil,
            image: "Item12",
            accessory: .newItems,
            scores: [4, 5, 5],
            country: nil,
            type: .pieces,
            reviews: nil
        ),
        Item(
            title: "Огурцы тепличные cадово-огородные",
            cost: 120.90,
            discount: nil,
            image: "Item13",
            accessory: nil,
            scores: [4, 5, 5, 5, 4],
            country: .italy,
            type: .kilograms,
            reviews: nil
        ),
        Item(
            title: "Огурцы тепличные cадово-огородные",
            cost: 120.90,
            discount: nil,
            image: "Item14",
            accessory: .priceByCard,
            scores: [4, 5, 3, 5, 4],
            country: nil,
            type: .kilograms,
            reviews: nil
        ),
        Item(
            title: "Огурцы тепличные cадово-огородные",
            cost: 120.90,
            discount: 0.25,
            image: "Item15",
            accessory: .hitPrices,
            scores: [4, 5, 3, 5, 4],
            country: nil,
            type: .both,
            reviews: ["nice", "good", "not bad", "doubt but ok", "yammy"]
        ),
        Item(
            title: "Дорадо Охлажденная Непотрошеная 300-400г",
            cost: 120.90,
            discount: 0.25,
            image: "Item16",
            accessory: .newItems,
            scores: [4, 5, 3, 2, 4],
            country: .france,
            type: .both,
            reviews: ["terrible", "normal", "not bad"]
        ),
        Item(
            title: "Энергетический Напиток AdrenaIine Rush 0,449л ж/б",
            cost: 99.90,
            discount: nil,
            image: "Item17",
            accessory: nil,
            scores: [5, 5, 5, 5, 4],
            country: .france,
            type: .pieces,
            reviews: ["perfect", "normal", "not bad", "nice", "good", "excellent"]
        ),
        Item(
            title: "Манго Кео",
            cost: 9569.90,
            discount: 0.25,
            image: "Item18",
            accessory: .hitPrices,
            scores: [5, 4, 5, 5, 4],
            country: .russia,
            type: .both,
            reviews: ["perfect", "normal"]
        )
    ]
}
