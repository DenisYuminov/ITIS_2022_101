enum Music {
    case new([Release])
    case popular([Release])
    
    var items: [Release]{
             switch self{
                 case .new(let items), .popular(let items):
                 return items
             }
         }

    var count: Int{
             items.count
         }
    var title: String{
            switch self{
            case .new(_):
                return "CHARTS"
            case .popular(_):
                return "ALBUMS / TODAY"
            }
        }
}


struct Release {
    let name: String
    let image: String
}

struct Data {
    let new: Music = {
        .new([.init(name: "", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F28417d8f2f4d5da33ae32dd2ec8f0d4c.1000x1000x1.jpg"),
              .init(name: "", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F31496d46a302dd9b55416525688ac9d9.1000x1000x1.png"),
              .init(name: "", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F57b2d5a2e175d1385646a7d5cb78e4bc.1000x1000x1.png"),
              .init(name: "", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2Fc807961087256ae01fa1005527394ec2.1000x1000x1.jpg"),
              .init(name: "", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2Fd18baece02319973d160480b9e1380b9.1000x1000x1.jpg"),
              .init(name: "", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F9455e63653e9a0801a7804404c684bc2.1000x1000x1.jpg"),
              .init( name: "", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F9789034fd486c0aabafe8961514d139f.1000x1000x1.jpg"),
              .init(name: "", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F00cc579aca9786a2d1ba1c995f828b44.1000x1000x1.png"),
              .init(name: "", image: "https://t2.genius.com/unsafe/600x600/https%3A%2F%2Fimages.genius.com%2F4341bbdfc986f1ba7a44bda3409018f6.1000x1000x1.jpg"),
              .init(name: "", image: "https://assets.genius.com/images/default_cover_art.png?1667505721")]
    )}()
    let popular: Music = {
        .popular([.init(name: "Her Loss\nDrake & 21 Savage", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F31496d46a302dd9b55416525688ac9d9.1000x1000x1.png"),
              .init(name: "SMITHEREENS\nJoji", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F00cc579aca9786a2d1ba1c995f828b44.1000x1000x1.png"),
              .init(name: "Hiver à Paris\nDinos", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F260b74c44dcb9e81533f4dc9fc09567c.1000x1000x1.jpg"),
              .init(name: "Being Funny in \na Foreign Language\n The 1975", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2Fc807961087256ae01fa1005527394ec2.1000x1000x1.jpg"),
              .init(name: "LAST ONE\nMorgenshtern", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2Fd18baece02319973d160480b9e1380b9.1000x1000x1.jpg"),
              .init(name: "TRENCHES BABY\nRondodasosa", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F60b1c29e3024a1c0fb6484c2d26fd23a.1000x1000x1.jpg"),
              .init(name: "PARAÍSO\nMora", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2F90745d5c5615f038aea9e0377fcb28c7.1000x1000x1.png"),
              .init(name: "Church Clothes 4\nLecrae", image: "https://t2.genius.com/unsafe/600x600/https%3A%2F%2Fimages.genius.com%2Fffd1b2af1081b637e035ed72423a71f0.1000x1000x1.jpg"),
              .init(name: "HATTORI\nMiyagi, Andy Panda", image: "https://t2.genius.com/unsafe/600x600/https%3A%2F%2Fimages.genius.com%2F4341bbdfc986f1ba7a44bda3409018f6.1000x1000x1.jpg"),
              .init(name: "CHELSEA 3\nTHRILL PILL", image: "https://t2.genius.com/unsafe/1512x0/https%3A%2F%2Fimages.genius.com%2Fc30bc93d0e5b003f77e4b7cab69f32b3.1000x1000x1.png")]
    )}()
    
    var dataList: [Music] {
        [new, popular]
    }
}
