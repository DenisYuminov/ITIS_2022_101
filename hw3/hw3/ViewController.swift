import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnimate()
        view.backgroundColor = .white
        NotificationCenter.default.addObserver(
            self, selector: #selector(reanimate),
            name: UIApplication.willEnterForegroundNotification,
            object: nil
        )
    }
    
    @objc func reanimate() {
        animate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLayerAndAnimate()
    }
    
    private let button: UIButton = .init()
    private var textLayer: CATextLayer = CATextLayer()
    private let recLabel: UILabel = .init()

    private func setupLayerAndAnimate() {
        textLayer.frame = CGRect(x: 95, y: 200, width: 220, height: 150)
        textLayer.fontSize = 23
        textLayer.alignmentMode = .center
        textLayer.string = "Ты хочешь \n получить \n миллион долларов\n прямо сейчас \n???"
        textLayer.backgroundColor = UIColor.green.cgColor
        view.layer.addSublayer(textLayer)
        
        animate()
    }
    
    private func setupAnimate() {
        
        view.addSubview(recLabel)
        recLabel.text = "ТОЛЬКО СЕГОДНЯ"
        recLabel.font = .systemFont(ofSize: 35)
        recLabel.sizeToFit()
        recLabel.frame.origin = CGPoint(x: 100, y: 350)
        
        view.addSubview(button)
        button.frame = CGRect(x: 200, y: 400, width: 60, height: 30)
        button.setTitle("Хочу!", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.setTitleColor(.green, for: .highlighted)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.backgroundColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 25
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -357).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func animate() {
        let colorAnimation = CABasicAnimation(keyPath: "backgroundColor")
        colorAnimation.toValue = UIColor.red.cgColor
        colorAnimation.duration = 0.5
        colorAnimation.repeatCount = .infinity
        colorAnimation.autoreverses = true
        let colorKey = "background color animation"
        textLayer.add(colorAnimation, forKey: colorKey)

        UIView.animate(
            withDuration: 0.1,
            delay: 0,
            options: [ .repeat, .autoreverse ]
        ) { [self] in
            recLabel.frame.origin.x = 30
        }

        UIView.animateKeyframes(
            withDuration: 2,
            delay: 0,
            options: [ .repeat, .autoreverse ]
        ) { [self] in
            UIView.addKeyframe(
                withRelativeStartTime: 0, relativeDuration: 0.5
            ) { [self] in
                button.frame.origin.x = 0
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0.25, relativeDuration: 0.5
            ) { [self] in
                button.frame.origin.y = 100
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0.75, relativeDuration: 0.5
            ) { [self] in
                button.frame.origin.x = 200
            
            }
            UIView.addKeyframe(
                withRelativeStartTime: 0.5, relativeDuration: 0.25
            ) { [self] in
                button.frame.origin.y = 400
            }
        }
    }
}

