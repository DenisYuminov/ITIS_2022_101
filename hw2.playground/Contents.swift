import UIKit
import PlaygroundSupport
import CoreGraphics


PlaygroundPage.current.needsIndefiniteExecution = true
let size100 = CGSize(width: 50, height: 50)
let view = UIView()
view.frame = CGRect(origin: .zero, size: CGSize(width:600, height: 300))
PlaygroundPage.current.liveView = view

let layer = view.layer
let gradientLayer = CAGradientLayer()
gradientLayer.startPoint = CGPoint(x: 1, y: 0)
gradientLayer.endPoint = CGPoint(x: 1, y: 1)
gradientLayer.colors = [
    UIColor.orange.cgColor.copy(alpha: 0.7) as Any,
    UIColor.yellow.cgColor.copy(alpha: 0.9) as Any,
    UIColor.green.cgColor.copy(alpha: 0.7) as Any,
    UIColor.cyan.cgColor.copy(alpha: 0.7) as Any
]

gradientLayer.frame = layer.bounds
layer.addSublayer(gradientLayer)
func getTextLayer(text: String, x: Int, y: Int){
    let textlayer = CATextLayer()
    textlayer.frame = CGRect(x: x, y: y, width: 200, height: 18)
    textlayer.fontSize = 12
    textlayer.alignmentMode = .center
    textlayer.string = text
    textlayer.foregroundColor = UIColor.blue.cgColor
    layer.addSublayer(textlayer)
}

getTextLayer(text: "My congratulations, Rafael !!!", x: 190, y: 100)
getTextLayer(text: "Your car is now in the parking lot :З", x: 190, y: 120)



let textlayer3 = CATextLayer()
textlayer3.frame = CGRect(x: 190, y: 150, width: 200, height: 18)
textlayer3.fontSize = 12
textlayer3.alignmentMode = .center
textlayer3.string = "👆  🚗  😀  🚔  📚"
layer.addSublayer(textlayer3)
func getSquareLayer(x: Int, y: Int, width: Int, height: Int) {
    let squareLayer = CALayer()
    squareLayer.frame = CGRect(x: x, y: y, width: width, height: height)
    squareLayer.backgroundColor = UIColor.yellow.cgColor
    layer.addSublayer(squareLayer)
}

func getDecLayer(x: Int, y: Int, width: Int, height: Int){
    let decLayer1 = CALayer()
    decLayer1.frame = CGRect(x: x, y: y, width: width, height: height)
    decLayer1.backgroundColor = UIColor.red.cgColor
    layer.addSublayer(decLayer1)
}

getSquareLayer(x: 100, y: 180, width: 80, height: 80)
getSquareLayer(x: 400, y: 160, width: 120, height: 120)
getDecLayer(x: 100, y: 213, width: 80, height: 15)
getDecLayer(x: 133, y: 180, width: 15, height: 80)
getDecLayer(x: 400, y: 207, width: 120, height: 30)
getDecLayer(x: 445, y: 160, width: 30, height: 120)


func getCircleLayer(x: Int, y: Int){
    let circleLayer1 = CALayer()
    circleLayer1.backgroundColor = UIColor.red.cgColor
    circleLayer1.frame = CGRect(origin:  .zero, size: size100)
    circleLayer1.cornerRadius = 50
    circleLayer1.frame.origin = CGPoint(
        x: x,
        y: y
    )
    layer.addSublayer(circleLayer1)
}
getCircleLayer(x: 103, y: 150)
getCircleLayer(x: 125, y: 150)
getCircleLayer(x: 420, y: 130)
getCircleLayer(x: 450, y: 130)
