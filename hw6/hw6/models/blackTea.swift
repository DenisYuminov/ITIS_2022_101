class BlackTea {
    let name: String
    let country: String
    let packageWeight: String
    let fortress: String

    init(name: String, country: String, packageWeight: String, fortress: String){
        self.name = name
        self.country = country
        self.packageWeight = packageWeight
        self.fortress = fortress
    }
}

var blackTeaList:[BlackTea] = [
    BlackTea(name: "Assam", country: "India", packageWeight: "100 g" , fortress: "Low"),
    BlackTea(name: "Darjeeling", country: "India", packageWeight: "50 g" , fortress: "Medium"),
    BlackTea(name: "Ceylon", country: "Sri Lanka", packageWeight: "100 g" , fortress: "Medium"),
    BlackTea(name: "Chai Kee Mun", country: "China", packageWeight: "75 g" , fortress: "High"),
    BlackTea(name: "Scottish", country: "English", packageWeight: "100 g" , fortress: "Medium"),
    BlackTea(name: "Earl Gray", country: "A lot", packageWeight: "100 g" , fortress: "Medium"),
    BlackTea(name: "Lapsang Souchong", country: "Russia", packageWeight: "1000 g" , fortress: "High"),
    BlackTea(name: "Dian Hong Cha", country: "China", packageWeight: "25 g" , fortress: "High"),
    BlackTea(name: "Masala Chai", country: "India", packageWeight: "50 g" , fortress: "Medium"),
    BlackTea(name: "Thai Milk", country: "Thai", packageWeight: "200 g" , fortress: "Low")
    ]

var reload1 = blackTeaList

func getBlackTea() -> BlackTea {
    let tea = reload1[0]
    if reload1.count > 0 {
        reload1.remove(at: 0)
    }
    if reload1.count == 0 {
        reload1 = blackTeaList
    }
    return tea
}
