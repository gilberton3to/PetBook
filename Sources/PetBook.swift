// The Swift Programming Language
// https://docs.swift.org/swift-book
//
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser

struct database: Codable {
    var name: String
}

struct PetCollection: Codable {
    var pets: [database] = []
//    var petNames: [String] = pets.flatMap( { $0 } )
    mutating func addPet(name: String) {
        let newPet = database(name: name)
        if pets.contains(where: { $0.name == name }) {
            print(catcurious, "\nError: This Pet already exists! 🚫\n")
        } else {
            pets.append(newPet)
            do {
                try Persistence.saveJson(self, file: "pet-collection.json")
                print(catheart, "\nPet inserted successfully! ✅\n")
            } catch {
                print(catsad, "\nError: Unable to add your Pet! ❌\n", error, "\n")
            }
        }
    }
    mutating func delPet(name: String) {
        if pets.contains(where: { $0.name == name }) {
            pets.removeAll { $0.name == name }
            do {
                try Persistence.saveJson(self, file: "pet-collection.json")
                print(catnormal, "\nPet deleted successfully! ✅\n")
            } catch {
                print(catconfused, "\nError: Unable to delete your Pet! ❌\n", error, "\n")
            }
        } else {
            print(catstranger, "\nError: This Pet does not exist! 🚫\n")
        }
    }
    mutating func delAllPet() {
        pets.removeAll()
        do {
            try Persistence.saveJson(self, file: "pet-collection.json")
            print(catdead, "\nAll Pets have been successfully deleted! ✅\n")
        } catch {
            print(catconfused, "\nError: Unable to delete your Pets! ❌\n", error, "\n")
        }
    }

}

var petCollection: PetCollection = (try? Persistence.readJson(file: "pet-collection.json")) ?? PetCollection()

@main
struct PetBook: ParsableCommand {
    static var configuration = CommandConfiguration(
        abstract: banner,
        usage: "petbook <subcommand> <argument> [OPTIONS]",
        discussion: """
            This tool will help you manage your collection of pets, choose the name of your pets by generating random names from the category of your choosing. You can \u{001B}[38;5;041madd, delete and view\u{001B}[0m all your pets.
            
            The \u{001B}[38;5;041m‘generate’\u{001B}[0m subcommand shows you a random name that you can use as your pet’s name, choosing among options such as: \u{001B}[38;5;041mmythological, human and cute names.\u{001B}[0m
            
            The \u{001B}[38;5;041m‘edit’\u{001B}[0m subcommand adds or deletes a pet in the collection of pets that you can store on the app, by typing the name of the pet you want to \u{001B}[38;5;041madd or delete.\u{001B}[0m
            
            The \u{001B}[38;5;041m‘view’\u{001B}[0m subcommand shows your collection of pets by typing \u{001B}[38;5;041m‘pets’\u{001B}[0m or the collection of names for the generator by typing \u{001B}[38;5;041m‘animal-names’.\n⮑\u{001B}[0m  You can too \u{001B}[38;5;041mdelete all\u{001B}[0m of your pets by choosing the option for \u{001B}[38;5;041mdelete all.\u{001B}[0m
            
            """,
        subcommands: [Generate.self, Edit.self, View.self]
    )
    // Criação das coleções de nomes
    
    struct Generate: ParsableCommand {
        @Argument(help: "generates the name of an animal, possibilities: 'cat', 'dog', 'bird', 'fish' or 'others'")
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
                print("\u{001B}[38;5;228m", randomCatDesign, "\n\n", randomCatMyth, "\n\u{001B}[0m")
            } else if person {
                print("\u{001B}[38;5;228m", randomCatDesign, "\n\n", randomCatPerson, "\n\u{001B}[0m")
            } else if cute {
                print("\u{001B}[38;5;228m", randomCatDesign, "\n\n", randomCatCute, "\n\u{001B}[0m")
            } else {
                print("\u{001B}[38;5;228m", randomCatDesign, "\n\n", randomCat, "\n\u{001B}[0m")
            }
        }
        
        //Function 2, Dog
        func typeNameDog() {
            
            let allNames: [String] = namesDog.values.flatMap { $0 }
            
            let randomDog = allNames.randomElement()!
            
            if mythological {
                print("\u{001B}[38;5;217m", randomDogDesign, "\n\n", randomDogMyth, "\n\u{001B}[0m")
            } else if person {
                print("\u{001B}[38;5;217m", randomDogDesign, "\n\n", randomDogPerson, "\n\u{001B}[0m")
            } else if cute {
                print("\u{001B}[38;5;217m", randomDogDesign, "\n\n", randomDogCute, "\n\u{001B}[0m")
            } else {
                print("\u{001B}[38;5;217m", randomDogDesign, "\n\n", randomDog, "\n\u{001B}[0m")
            }
        }
        
        //Function 3, Fish
        func typeNameFish() {
            
            let allNames: [String] = namesFish.values.flatMap { $0 }
            
            let randomFish = allNames.randomElement()!
            
            if mythological {
                print("\u{001B}[38;5;123m", randomFishDesign, "\n\n", randomFishMyth, "\n\u{001B}[0m")
            } else if person {
                print("\u{001B}[38;5;123m", randomFishDesign, "\n\n", randomFishPerson, "\n\u{001B}[0m")
            } else if cute {
                print("\u{001B}[38;5;123m", randomFishDesign, "\n\n", randomFishCute, "\n\u{001B}[0m")
            } else {
                print("\u{001B}[38;5;123m", randomFishDesign, "\n\n", randomFish, "\n\u{001B}[0m")
            }
        }
        
        //Function 4, Bird
        func typeNameBird() {
            
            let allNames: [String] = namesBird.values.flatMap { $0 }
            
            let randomBird = allNames.randomElement()!
            
            if mythological {
                print("\u{001B}[38;5;120m", randomBirdDesign, "\n\n", randomBirdMyth, "\n\u{001B}[0m")
            } else if person {
                print("\u{001B}[38;5;120m", randomBirdDesign, "\n\n", randomBirdPerson, "\n\u{001B}[0m")
            } else if cute {
                print("\u{001B}[38;5;120m", randomBirdDesign, "\n\n", randomBirdCute, "\n\u{001B}[0m")
            } else {
                print("\u{001B}[38;5;120m", randomBirdDesign, "\n\n", randomBird, "\n\u{001B}[0m")
            }
        }
        
        //Function 5, Others
        func typeNameOthers() {
            
            let allNames: [String] = namesOthers.values.flatMap { $0 }
            
            let randomOthers = allNames.randomElement()!
            
            if mythological {
                print("\u{001B}[38;5;207m", randomDesigns, "\n\n", randomOthersMyth, "\n\u{001B}[0m")
            } else if person {
                print("\u{001B}[38;5;207m", randomDesigns, "\n\n", randomOthersPerson, "\n\u{001B}[0m")
            } else if cute {
                print("\u{001B}[38;5;207m", randomDesigns, "\n\n", randomOthersCute, "\n\u{001B}[0m")
            } else {
                print("\u{001B}[38;5;207m", randomDesigns, "\n\n", randomOthers, "\n\u{001B}[0m")
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
                print(invalidanimal, "\n\n", "Invalid animal! 🚫\n")
            }
        }
    }
    struct Edit: ParsableCommand {
        @Option(name: .shortAndLong, help: "Inserts a pet to your collection")
        var insert: String?
        @Option(name: .shortAndLong, help: "Deletes a pet from your collection")
        var delete: String?
        
        func run() throws {
            guard insert == nil else {
                petCollection.addPet(name: insert!)
                return
            }
            guard delete == nil else {
                petCollection.delPet(name: delete!)
                return
            }
            print("\nPlease specify one of the options: insert(-i) or delete(-d) ⚠️")
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
            let onlyCats = allNamesCat.joined(separator: "\n")
            //dog
            let allNamesDog: [String] = namesDog.values.flatMap { $0 }
            let onlyDogs = allNamesDog.joined(separator: "\n")
            //fish
            let allNamesFish: [String] = namesFish.values.flatMap { $0 }
            let onlyFishes = allNamesFish.joined(separator: "\n")
            //bird
            let allNamesBird: [String] = namesBird.values.flatMap { $0 }
            let onlyBirds = allNamesBird.joined(separator: "\n")
            //others
            let allNamesOthers: [String] = namesOthers.values.flatMap { $0 }
            let onlyOthers = allNamesOthers.joined(separator: "\n")
            
            print("\u{001B}[38;5;228m", randomCatDesign, "🐱 Cats:", onlyCats, "\u{001B}[38;5;217m", randomDogDesign, "🐶 Dogs:", onlyDogs, "\u{001B}[38;5;123m", randomFishDesign, "🐠 Fishes:", onlyFishes, "\u{001B}[38;5;120m", randomBirdDesign, "🦜 Birds:", onlyBirds, "\u{001B}[38;5;207m", randomDesigns, "🎲 Varied:", onlyOthers, "", separator: "\n\n")
        }
        
        func run() throws {
            //to print only the names of the user's pets
            let allUserPets = petCollection.pets.map { $0.name }
            let onlyPets = allUserPets.joined(separator: "\n ")
            //end
            if collection == "pets" {
                if delete == true {
                    petCollection.delAllPet()
                } else {
                    print("\n", petcollectiondesign, "\n\u{001B}[38;5;041m", onlyPets, "\u{001B}[0m\n") }
            } else if collection == "animal-names"{
                allNames()
            } else {
                print("\n", invalidanimal, "\n\nError: invalid option, choose 'pets' or 'animal-names' to continue! ⚠️\n")
            }
        }
    }
}
