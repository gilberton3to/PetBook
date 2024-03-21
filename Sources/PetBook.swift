// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

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

struct database: Codable {
    var name: String
}

struct PetCollection: Codable {
    var pets: [database] = []
//    var petNames: [String] = pets.flatMap( { $0 } )
    mutating func addPet(name: String) {
        let newPet = database(name: name)
        if pets.contains(where: { $0.name == name }) {
            print("Erro: Esse Pet já existe!")
        } else {
            pets.append(newPet)
            do {
                try Persistence.saveJson(self, file: "pet-collection.json")
                print("Pet inserido(a) com sucesso!")
            } catch {
                print("Erro: não foi possível adicionar o seu Pet!", error)
            }
        }
    }
    mutating func delPet(name: String) {
        if pets.contains(where: { $0.name == name }) {
            pets.removeAll { $0.name == name }
            do {
                try Persistence.saveJson(self, file: "pet-collection.json")
                print("Pet deletado com sucesso!")
            } catch {
                print("Erro: não foi possível deletar o seu Pet!", error)
            }
        } else {
            print("Erro: Esse Pet não existe")
        }
    }
    mutating func delAllPet() {
        pets.removeAll()
        do {
            try Persistence.saveJson(self, file: "pet-collection.json")
            print("Todos os Pets foram deletados com sucesso!")
        } catch {
            print("Erro: não foi possível deletar os seus Pets!", error)
        }
    }

}

var petCollection: PetCollection = (try? Persistence.readJson(file: "pet-collection.json")) ?? PetCollection()

@main
struct PetBook: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: "A Pet Namer and Organizer",
        usage: "petbook <subcommand> <argument> [OPTIONS]",
        discussion: """
            This tool will help you manage your collection of pets, choose the name of your pets by generating random names from the category of your choosing. You can add, delete and view all your pets.
            
            The ‘generate’ subcommand shows you a random name that you can use as your pet’s name, choosing among options such as: mythological, human and cute names.

            The ‘edit’ subcommand adds or deletes a pet in the collection of pets that you can store on the app, by typing the name of the pet you want to add or delete.

            The ‘view’ subcommand shows you the collection of pets you have by typing ‘pets’ or the collection of names the app gives to you by typing ‘animal-names’, and you want to delete all of your pets after checking the collection by choosing the designated delete option.
            """,
        subcommands: [Generate.self, Edit.self, View.self]
        )
    // Criação das coleções de nomes
}

struct Generate: ParsableCommand {
    @Argument(help: "generates the name of an animal, possibilities: 'cat', 'dog', 'bird', 'fish' or 'other'")
    var animal: String
    //
    @Flag(name: .shortAndLong, help: "Generate a mythological name.")
    var mythological = false
    @Flag(name: .shortAndLong, help: "Generate a human name.")
    var person = false
    @Flag(name: .shortAndLong, help: "Generate a cute name.")
    var cute = false
    
    //Function 1, Cat
    func typeNameCat() {
        
        let allNames: [String] = namesCat.values.flatMap { $0 }
        
        let randomCat = allNames.randomElement()!
        
        if mythological {
            print(randomCatMyth)
        } else if person {
            print(randomCatPerson)
        } else if cute {
            print(randomCatCute)
        } else {
            print(randomCat)
        }
    }
    
    //Function 2, Dog
    func typeNameDog() {
        
        let allNames: [String] = namesDog.values.flatMap { $0 }
        
        let randomDog = allNames.randomElement()!
        
        if mythological {
            print(randomDogMyth)
        } else if person {
            print(randomDogPerson)
        } else if cute {
            print(randomDogCute)
        } else {
            print(randomDog)
        }
    }
    
    //Function 3, Fish
    func typeNameFish() {
        
        let allNames: [String] = namesFish.values.flatMap { $0 }
        
        let randomFish = allNames.randomElement()!
        
        if mythological {
            print(randomFishMyth)
        } else if person {
            print(randomFishPerson)
        } else if cute {
            print(randomFishCute)
        } else {
            print(randomFish)
        }
    }
    
    //Function 4, Bird
    func typeNameBird() {
        
        let allNames: [String] = namesBird.values.flatMap { $0 }
        
        let randomBird = allNames.randomElement()!
        
        if mythological {
            print(randomBirdMyth)
        } else if person {
            print(randomBirdPerson)
        } else if cute {
            print(randomBirdCute)
        } else {
            print(randomBird)
        }
    }
    
    //Function 5, Others
    func typeNameOthers() {
        
        let allNames: [String] = namesOthers.values.flatMap { $0 }
        
        let randomOthers = allNames.randomElement()!
        
        if mythological {
            print(randomOthersMyth)
        } else if person {
            print(randomOthersPerson)
        } else if cute {
            print(randomOthersCute)
        } else {
            print(randomOthers)
        }
    }
    
    func run() {
        switch animal {
        case "cat":
            typeNameCat()
        case "dog":
            typeNameDog()
        case "fish":
            typeNameFish()
        case "bird":
            typeNameBird()
        case "others":
            typeNameOthers()
        default:
            print("Animal inválido")
        }
    }
}
struct Edit: ParsableCommand {
    @Option(name: .shortAndLong, help: "Inserts a pet (name) to your collection")
    var insert: String?
    @Option(name: .shortAndLong, help: "Deletes a pet (name) from your collection")
    var delete: String?
    
    func run() throws {
        guard insert == nil else {
            print(#"""
                             __
                            /  \
                           / ..|\
                          (_\  |_)
                          /  \@'
                         /     \
                    _   /  `   |
                    \\/  \  | _\
                     \   /_ || \\_
                      \____)|_) \_)
                """#)
            petCollection.addPet(name: insert!)
            return
        }
        guard delete == nil else {
            petCollection.delPet(name: delete!)
            print(#"""
                             __
                            /  \
                           / ..|\
                          (_\  |_)
                          /  \@'
                         /     \
                    _   /  `   |
                    \\/  \  | _\
                     \   /_ || \\_
                      \____)|_) \_)
                  """#)
            return
        }
        print("Por favor, especifique uma das opções: inserir ou deletar")
    }

}
struct View: ParsableCommand {
    @Argument(help: "Shows your collection of pets or the collection of the names the app can give you. possibilities: 'pets' or 'animal-names'.")
    var collection: String
    //
    @Flag(name: .shortAndLong, help: "Deletes all pets from your collection")
    var delete = false
    
    func allNames() {
        //cat
        let allNamesCat: [String] = namesCat.values.flatMap { $0 }
        //dog
        let allNamesDog: [String] = namesDog.values.flatMap { $0 }
        //fish
        let allNamesFish: [String] = namesFish.values.flatMap { $0 }
        //bird
        let allNamesBird: [String] = namesBird.values.flatMap { $0 }
        //others
        let allNamesOthers: [String] = namesOthers.values.flatMap { $0 }
        
        print("Gatos:", allNamesCat, "Cachorros:", allNamesDog, "Passaros:", allNamesBird, "Peixes:", allNamesFish, "Variados:", allNamesOthers, separator: "\n\n")
    }
    
    func run() throws {
        if collection == "pets" {
            if delete == true {
                petCollection.delAllPet()
            } else {
                print(petCollection.pets) }
        } else if collection == "animal-names"{
            allNames()
        }
    }
}

//        for numero in numeros {
//            if numero % 2 == 0 {
//                pares.append(numero)
//            }
//        }

//        var pares = numeros.filter { numero in
//            return numero % 2 == 0
//        }

//        var pares = numeros.filter { numero in numero % 2 == 0 }

//        var pares = numeros.filter { return $0 % 2 == 0 }

//        var pares = numeros.filter { $0 % 2 == 0 }
