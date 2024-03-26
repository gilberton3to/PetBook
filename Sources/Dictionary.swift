//
//  Dictionary.swift
//
//
//  Created by Gilberto Neto on 23/03/24.
//

import Foundation

//Cat
let namesCat: [String: [String]] = [
    "mitológicos": ["Apolo", "Artemis", "Athena", "Hermes", "Hades", "Persefone", "Zeus", "Hera", "Poseidon", "Medusa"],
    "próprios": ["Chiquinho", "Sofia", "Jasmin", "Maria", "Pedroca", "Gabrielo", "Ana", "Camile", "John"],
    "fofos": ["Biscoito", "Bolinha", "Pompom", "Pelúcia", "Fofucho", "Docinho", "Fofura", "Algodão", "Pituca"]
]
let randomCatMyth = namesCat["mitológicos"]!.randomElement()!
let randomCatPerson = namesCat["próprios"]!.randomElement()!
let randomCatCute = namesCat["fofos"]!.randomElement()!
//Dog
let namesDog: [String: [String]] = [
    "mitológicos": ["Thor", "Freya", "Loki", "Odin", "Nanna", "Fenrir", "Frigg", "Tyr", "Baldur", "Valquiria"],
    "próprios": ["Max", "Mac", "Luna", "Charlie", "Bella", "Daisy", "Rocky", "Lola", "Bud", "Sophie"],
    "fofos": ["Bombinha", "Baleia", "Bolota", "Mel", "Chocolate", "Lulu", "Amarelinho", "Peãozinho"]
]
let randomDogMyth = namesDog["mitológicos"]!.randomElement()!
let randomDogPerson = namesDog["próprios"]!.randomElement()!
let randomDogCute = namesDog["fofos"]!.randomElement()!
//Fish
let namesFish: [String: [String]] = [
    "mitológicos": ["Tritão", "Nereu", "Amphitrite", "Thalasse", "Oceanus", "Nerida", "Ceto", "Dagon", "Undine"],
    "próprios": ["Homero", "Gineceu", "Nemo", "Marlin", "Phelps", "Christopher", "Leviatã", "Alvin"],
    "fofos": ["Sereia", "Fonfon", "Lula Molusco", "Coral", "Azulzin", "Estrelinha", "Anêmona"]
]
let randomFishMyth = namesFish["mitológicos"]!.randomElement()!
let randomFishPerson = namesFish["próprios"]!.randomElement()!
let randomFishCute = namesFish["fofos"]!.randomElement()!
//Bird
let namesBird: [String: [String]] = [
    "mitológicos": ["Icarus", "Fênix", "Sílvia", "Hélio", "Aurora", "Eos", "Zephyr", "Ilíos", "Thalassa"],
    "próprios": ["Pepe", "Titi", "Simon", "Tinga", "Júlia", "Cooper", "Brutus", "Harpy"],
    "fofos": ["Pena", "Plumita", "Algodão", "Pipoca", "Cookie", "Pingo", "Tutu", "Avelã"]
]
let randomBirdMyth = namesBird["mitológicos"]!.randomElement()!
let randomBirdPerson = namesBird["próprios"]!.randomElement()!
let randomBirdCute = namesBird["fofos"]!.randomElement()!
//Others
let namesOthers: [String: [String]] = [
    "mitológicos": ["Cerberus", "Percy", "Griffin", "Pegasus", "Quimera", "Hydra", "Sphynx", "Minotauro", "Ciclope"],
    "próprios": ["Cassandra", "Bráulio", "Louyse", "Mariane", "Rafa", "Juliano", "Matheus", "Isa", "Edu"],
    "fofos": ["Ziggy", "Luna", "Pepper", "Zuzu", "Whisker", "Mochi", "Beppo", "ZigZag", "Pippin"]
]
let randomOthersMyth = namesOthers["mitológicos"]!.randomElement()!
let randomOthersPerson = namesOthers["próprios"]!.randomElement()!
let randomOthersCute = namesOthers["fofos"]!.randomElement()!
