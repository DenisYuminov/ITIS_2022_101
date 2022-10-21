import Foundation

class GreenTea {
    let name: String
    let description: String

    init(name: String, description: String){
        self.name = name
        self.description = description
    }
}
var greenTeaList:[GreenTea] = [
    GreenTea(name: "Matcha", description: ""),
    GreenTea(name: "Kabusecha", description: "Last part!!!"),
    GreenTea(name: "Fukamushi", description: "powdery💪"),
    GreenTea(name: "Genmaicha", description: ""),
    GreenTea(name: "Hojicha", description: ""),
    GreenTea(name: "Shincha", description: "Hit of the season 🔥"),
    GreenTea(name: "Ichibancha", description: "")
]

var reload = greenTeaList

func getGreenTea() -> GreenTea {
    let tea = reload[0]
    if reload.count > 0 {
        reload.remove(at: 0)
    }
    if reload.count == 0 {
        reload = greenTeaList
    }
    return tea
}


