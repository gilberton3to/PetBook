# Pet Name Generator & Collection Manager

This is a command line program (CLI) developed to help you manage your collection of pets, choose the name of your pets by generating
random names from the category of your choosing. You can add, delete and view all your pets.

## Features

- **Name Generator**: Generate new creative and unique names for your pets.

- **Pet Registration**: Register your pets in a collection to maintain organized control.

- **Easy to Use**: Simple and intuitive interface for a friendly user experience.

## Language

Be sure to find out the language:

- Swift

## How To Use

**SUBCOMMANDS:**

-generate

-edit

-view

**OVERVIEW: Generate**

**USAGE:** 

petbook generate <animal> [OPTIONS]

**ARGUMENTS:**

<animal> generates the name of an animal, possibilities: 'cat', 'dog', 'bird', 'fish' or 'other'.

**FLAGS:**

-m, --mythological Generate a mythological name.

-p, —-person Generate a human name.

-c, —-cute Generate a cute name.

**OVERVIEW: Edit**

**USAGE:** 

petbook edit <pet-name> [OPTIONS]

**ARGUMENTS:**

<pet-name> the name of the pet you want to add or delete in your collection, eg. 'edit <pet-name> -i'.

**OPTIONS:**

-i, --insert Adds a new pet to your collection.

-d, --delete Deletes a pet of your choosing from your collection.

**OVERVIEW: View**

**USAGE:**

petbook view <collection> [OPTIONS]

**ARGUMENTS:**

<collection> shows your collection of pets or the collection of the names the app can give you. possibilities: 'pets' or 'animal-names'.

**FLAG:**

-d, --delete Delete all pets from a collection.

## Contribution

Contributions are welcome! Feel free to open an issue to report bugs, suggest new features or send pull requests.

---
