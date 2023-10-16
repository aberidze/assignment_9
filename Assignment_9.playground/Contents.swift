/* --------------- Pirates ⛴️🏴‍☠️ --------------- */
// Subtask 1: class PirateShip
class PirateShip: Cannons {
    let name: String
    var cannonsCount: Int
    // SOLID (OCP):
    private let crewManaging: CrewManaging
    private let cargoManaging: CargoManaging
    
    init(name: String, cannonsCount: Int, crewManaging: CrewManaging, cargoManaging: CargoManaging) {
        self.name = name
        self.cannonsCount = cannonsCount
        self.crewManaging = crewManaging
        self.cargoManaging = cargoManaging
    }
    
    func addCargo(_ newCargo: String) {
        cargoManaging.addToCargo(newCargo)
    }
    
    func removeCargo(_ toRemove: String) {
        cargoManaging.removeFromCargo(toRemove)
    }
    
    func listCargo() {
        for cargo in cargoManaging.cargo {
            print("- \(cargo)")
        }
    }
    
    func addCrew(_ newMember: String) {
        crewManaging.addToCrew(newMember)
    }
    
    func removeCrew(_ toRemove: String) {
        crewManaging.removeFromCrew(toRemove)
    }
    
    func listCrew() {
        for crew in crewManaging.crew {
            print("- \(crew)")
        }
    }
    
    func cannonCount() {
        print("\(cannonsCount) Cannon Available to Fire!")
    }
    
    func fireCannon(count: Int) {
        if count <= cannonsCount {
            cannonsCount -= count
            print("💣 \(count) Cannons Fired 🔥 \(cannonsCount) left!")
        } else if cannonsCount > 0 {
            print("🛑 Only \(cannonsCount) Cannons Available!")
        } else {
            print("🛑 No Cannons Left!")
        }
    }
}


// SOLID (SRP) _ class CrewManager
class CrewManager: CrewManaging {
    var crew: [String]
    
    init(crew: [String]) {
        self.crew = crew
    }
    
    func addToCrew(_ newMember: String) {
        crew.append(newMember)
        print("\(newMember) added to crew!")
    }
    
    func removeFromCrew(_ toRemove: String) {
        if let memberIndex = crew.firstIndex(of: toRemove) {
            crew.remove(at: memberIndex)
            print("\(toRemove) was removed from a crew ☠️")
        } else {
            print("🛑 ERROR! \(toRemove) is not a member of a crew!")
        }
    }
}


// SOLID (SRP) _ class CargoManager
class CargoManager: CargoManaging {
    var cargo: [String]
    
    init(cargo: [String]) {
        self.cargo = cargo
    }
    
    func addToCargo(_ newCargo: String) {
        cargo.append(newCargo)
        print("\(newCargo) added to cargo!")
    }
    
    func removeFromCargo(_ toRemove: String) {
        if let cargoIndex = cargo.firstIndex(of: toRemove) {
            cargo.remove(at: cargoIndex)
            print("\(toRemove) removed from a cargo ❌")
        } else {
            print("🛑 ERROR! \(toRemove) is not in a cargo!")
        }
    }
}


// SOLID (Liskov) _ class Frigate
class Frigate: PirateShip {
    var specialWeapons: [String]
    
    init(specialWeapons: [String], name: String, cannonsCount: Int, crewManaging: CrewManaging, cargoManaging: CargoManaging) {
        self.specialWeapons = specialWeapons
        super.init(name: name, cannonsCount: cannonsCount, crewManaging: crewManaging, cargoManaging: cargoManaging)
    }
    
    func fireFromSpecialWeapon(specialWeapon: String) {
        if let weaponIndex = specialWeapons.firstIndex(of: specialWeapon) {
            specialWeapons.remove(at: weaponIndex)
            print("Fired From \(specialWeapon) 💣🔥!")
        } else {
            print("ERROR! No such weapon!")
        }
    }
}


// SOLID (Liskov) _ class Galleon
class Galleon: PirateShip {
    var cargoCapacity: Int
    
    init(cargoCapacity: Int, name: String, cannonsCount: Int, crewManaging: CrewManaging, cargoManaging: CargoManaging) {
        self.cargoCapacity = cargoCapacity
        super.init(name: name, cannonsCount: cannonsCount, crewManaging: crewManaging, cargoManaging: cargoManaging)
    }
    
    func changeCapacity(_ newCapacity: Int) {
        if newCapacity > 0 {
            if newCapacity < cargoCapacity {
                cargoCapacity = newCapacity
                print("Capacity Reduced to \(newCapacity)!")
            } else {
                cargoCapacity = newCapacity
                print("Capacity Increased to \(newCapacity)!")
            }
        } else {
            print("Invalid Capacity!")
        }
    }
}

// SOLID (Interface Segregation) _ protocol Cannons
protocol Cannons {
    var cannonsCount: Int { get set }
    func cannonCount()
    func fireCannon(count: Int)
}


// SOLID (Dependency Inversion) _ protocol CrewManaging
protocol CrewManaging {
    var crew: [String] { get set }
    func addToCrew(_ newMember: String)
    func removeFromCrew(_ toRemove: String)
}


// SOLID (Dependency Inversion) _ protocol CargoManaging
protocol CargoManaging {
    var cargo: [String] { get set }
    func addToCargo(_ newCargo: String)
    func removeFromCargo(_ toRemove: String)
}


// Subtask 2: KISS _ class TreasureMap
class TreasureMap {
    let x: Int
    let y: Int
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func hintToTreasure(x: Int, y: Int) {
        if x == self.x && y == self.y {
            print("Congratulations 🎉 Treasure Found!")
        } else {
            print("HINT:")
            // Checking X coordinate:
            if x > self.x {
                print("Go Left")
            } else if x < self.x {
                print("Go Right")
            }
            
            // Checking Y coordinate:
            if y > self.y {
                print("Go Down")
            } else if y < self.y {
                print("Go Up")
            }
        }
    }
}


// Subtask 3: YAGNI _ class SeaAdventure
class SeaAdventure {
    let adventureType: String
    
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print("Our ship has encountered \(adventureType)!")
    }
}


// Subtask 4: DRY _ class PirateCode
class PirateCode {
    private func discussTerms(term: String) {
        print("Negotiations about \(term) has begun!")
    }
    
    func parley() {
        discussTerms(term: "parley")
        print("Negotiations Successful 🫱🏽‍🫲🏾")
    }
    
    func mutiny() {
        discussTerms(term: "mutiny")
        print("Negotiations not possible... Fight ⚔️")
    }
}


// Subtask 5: Simulation
let crew = CrewManager(crew: [
    "Jack Sparrow",
    "Will Turner",
    "Elizabeth Swann",
    "Joshamee Gibbs"
])
let cargo = CargoManager(cargo: [
    "Gold",
    "Silver",
    "Jewels",
    "Tobacco",
    "Rum",
    "Ammunition"
])
let theBlackPearl = PirateShip(
    name: "The Black Pearl",
    cannonsCount: 120,
    crewManaging: crew,
    cargoManaging: cargo
)
let treasuryMap = TreasureMap(x: 10, y: 19)
let pirateCode = PirateCode()
let seaAdventure = SeaAdventure(adventureType: "Meeting with FlyingDutchman!")

var shipsX = 0
var shipsY = 0
treasuryMap.hintToTreasure(x: shipsX, y: shipsY)
shipsX += 5
shipsY += 7
treasuryMap.hintToTreasure(x: shipsX, y: shipsY)
shipsX += 7
shipsY += 12
treasuryMap.hintToTreasure(x: shipsX, y: shipsY)
shipsX -= 2
treasuryMap.hintToTreasure(x: shipsX, y: shipsY)

print("\nAdventure Time\n--------------------------------")
seaAdventure.encounter()
pirateCode.mutiny()
