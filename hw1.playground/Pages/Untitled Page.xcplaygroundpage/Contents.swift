class Hero {
    var isAlive = true
    let name: String
    var style = "Hero"
    var hp : Int
    var mp = 50
    var damage: Int
    init(name: String, damage: Int) {
        self.name = name
        self.damage = damage
        self.hp = 100
    }

    func attack(enemy: Hero){
        enemy.hp -= self.damage
        print("\(self.name) delt \(self.damage) to the \(enemy.name), now \(enemy.name) has \(enemy.hp) hp")
        if enemy.hp <= 0 {
            enemy.isAlive = false
        }
    }
}

class Knight: Hero {
    override init(name: String, damage: Int) {
        super.init(name: name, damage: damage)
        self.hp = 200
        self.style = "Knight"

    }


    override func attack(enemy: Hero) {
        self.attack(enemy: enemy)
        self.mp += 1
    }
}

class Wizard: Hero {
    override init(name: String, damage: Int) {
        super.init(name: name, damage: damage)
        self.mp = 100
        self.style = "Wizard"
    }

    func buf(mate: Knight) {
        if self.mp - 20 > 0 {
            mate.damage += 20
            self.mp -= 20
        }
    }

    override func attack(enemy: Hero) {
        self.damage = 15
        self.attack(enemy: enemy)
        self.mp += 5
    }
}

class Zombi: Hero {
    override init(name: String, damage: Int) {
        super.init(name: name, damage: damage)
        self.hp = 250
    }
    
    override func attack(enemy: Hero) {
        self.hp += 10
        if Int.random(in: 0...10) < 5 {
            self.fury()
            self.attack(enemy: enemy)
            self.stable()
        } else {
            self.attack(enemy: enemy)
        }
        self.mp += 5
    }
    
    func fury() {
        self.damage += 15
        self.mp -= 15
    }
    
    func stable () {
        self.damage -= 15
    }
    
}

class Werewolf: Hero {
    var regenerationCount = 2
    override init(name: String, damage: Int) {
        super.init(name: name, damage: damage)
        self.hp = 250
    }
    
    func regeneration() {
        if regenerationCount > 0 {
            self.hp = 250
            regenerationCount -= 1
        }
    }
    
    override func attack(enemy: Hero) {
        if self.hp <= 30 {
            self.regeneration()
        }
        self.attack(enemy: enemy)
    }
}



let p1 = Knight(name: "s", damage: 50)
let p2 = Knight(name: "k", damage: 50)
let p3 = Knight(name: "bad", damage: 30)
let p4 = Knight(name: "wad", damage: 30)
let p5 = Knight(name: "sad", damage: 30)
let p6 = Knight(name: "xad", damage: 30)
let w1 = Wizard(name: "a", damage: 30)
let w2 = Wizard(name: "a", damage: 30)
let w3 = Wizard(name: "a", damage: 30)
let w4 = Wizard(name: "a", damage: 30)
let z1 = Zombi(name: "z1", damage: 20)
let z3 = Zombi(name: "z3", damage: 20)
let z2 = Zombi(name: "z2", damage: 20)
let z4 = Zombi(name: "z4", damage: 20)
let z5 = Zombi(name: "z5", damage: 20)
let z6 = Zombi(name: "z6", damage: 20)
let z7 = Zombi(name: "z7", damage: 20)
let z8 = Zombi(name: "z8", damage: 20)
let z9 = Zombi(name: "z9", damage: 20)
let ww1 = Werewolf(name: "w1", damage: 30)
let ww2 = Werewolf(name: "w2", damage: 30)
let ww3 = Werewolf(name: "w3", damage: 30)
let ww4 = Werewolf(name: "w4", damage: 30)

var team1 = [p1,p2,p3,p4,p5,p6,w1,w2,w3,w4]
var team2 = [z1,z2,z3,z4,z5,z6,z7,z8,z9,ww1,ww2,ww3,ww4]





struct Team{
    var nameOfTeam: String
    var listOfPlayers = [Hero]()
    init(nameOfTeam: String, listOfPlayers: Array<Hero>) {
        self.listOfPlayers = listOfPlayers
        self.nameOfTeam = nameOfTeam
    }
    func attack(enemyTeam: Team){
        let newArray = enemyTeam.listOfPlayers
            .sorted { $0.hp < $1.hp }
        let enemy = newArray[0]
        for player in self.listOfPlayers where player.isAlive == true {
            player.attack(enemy: enemy)
        }
    }
    
    func isTeamAlive() -> Bool {
        for player in self.listOfPlayers {
            if player.isAlive == false {
                return false
            }
        }
        return true
    }
}


struct Battle {
    var goodTeam: Team
    var badTeam: Team
    
    init(goodTeam: Team, badTeam: Team){
        self.goodTeam = goodTeam
        self.badTeam = badTeam
    }
    
    func battle() {
        var count = 0
        while count != 50 && goodTeam.isTeamAlive() && badTeam.isTeamAlive() {
            goodTeam.attack(enemyTeam: badTeam)
            badTeam.attack(enemyTeam: goodTeam)
            if goodTeam .isTeamAlive() == false {
                print("\(badTeam.nameOfTeam) Win")
            }
            if badTeam.isTeamAlive() == false {
                print("\(goodTeam.nameOfTeam) Win")
            }
            count += 1
            
        }
        print("Battle is finished")
    }
}

let t1 = Team(nameOfTeam: "Good", listOfPlayers: team1)
let t2 = Team(nameOfTeam: "Bad", listOfPlayers: team2)
let battle = Battle(goodTeam: t1, badTeam: t2)
battle.battle()
