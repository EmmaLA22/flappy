//
//  GameScene.swift
//  flappybirproyect
//
//  Created by Administrador on 24/10/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var pajaro = SKSpriteNode ()
    var ColorCielo = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -5.0)
        
        
        var ColorCielo = SKColor (red: 113/255,green: 197/255, blue: 207/255, alpha: 1)
        self.backgroundColor = ColorCielo
        
        var TexturaPajaro1 = SKTexture (imageNamed: "bird")
        TexturaPajaro1.filteringMode = SKTextureFilteringMode.nearest
        
        var TexturaPajaro2 = SKTexture (imageNamed: "bird1")
        TexturaPajaro2.filteringMode = SKTextureFilteringMode.nearest
        
        var animacionAleteo = SKAction.animate(with: [TexturaPajaro1,TexturaPajaro2], timePerFrame:  0.2)
        var Vuelo  = SKAction.repeatForever(animacionAleteo)
        
        pajaro = SKSpriteNode(texture: TexturaPajaro1)
        pajaro.position = CGPoint(x: self.frame.size.width / 2.8, y: CGRectGetMidY(self.frame) )
        pajaro.run(Vuelo)
        
        pajaro.physicsBody = SKPhysicsBody(circleOfRadius: pajaro.size.height/2)
        pajaro.physicsBody?.isDynamic = true
        pajaro.physicsBody?.allowsRotation = false
        
        self.addChild(pajaro)
        
        
        var TexturaSuelo = SKTexture(imageNamed: "ground")
        TexturaSuelo.filteringMode = SKTextureFilteringMode.nearest
        
        var movimientoSuelo = SKAction.moveBy (x: -TexturaSuelo.size().width, y : 0,duration : TimeInterval(0.01 * TexturaSuelo.size().width))
        let duration: TimeInterval = 0.01
        let yValue: CGFloat = 0.0
        var resetSuelo = SKAction.moveBy(x: TexturaSuelo.size().width, y: yValue, duration: duration)
        
        let incremento: CGFloat = 2 + self.frame.size.width/(TexturaSuelo.size().width)
        for i in stride(from: CGFloat(0), to: incremento, by: 1) {
            var fraccion = SKSpriteNode(texture: TexturaSuelo)
            fraccion.zPosition = -99
            fraccion.position = CGPoint(x: i*fraccion.size.width, y: fraccion.size.height)
            self.addChild(fraccion)
        }
        
        var TopeSuelo = SKNode()
        TopeSuelo.position = CGPoint(x: 0, y: TexturaSuelo.size().height / 2)
        TopeSuelo.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.frame.size.width, height: TexturaSuelo.size().height), center: CGPoint(x: self.frame.size.width / 2, y: TexturaSuelo.size().height / 2))
        TopeSuelo.physicsBody?.isDynamic = false
        self.addChild (TopeSuelo)
        
        var TexturaCielo = SKTexture(imageNamed: "sky" )
        TexturaCielo.filteringMode = SKTextureFilteringMode.nearest
        
        var movimientoCielo = SKAction.moveBy (x: -TexturaCielo.size().width, y : 0,duration : TimeInterval(0.05 * TexturaCielo.size().width))
        let Duration: TimeInterval = 0.01
        let yValueCielo: CGFloat = 0.0
        var resetCielo = SKAction.moveBy(x: TexturaSuelo.size().width, y: yValueCielo, duration: Duration)
        
        
        let _: CGFloat = 2 + self.frame.size.width/(TexturaCielo.size().width)
        for i in stride(from: CGFloat(0), to: incremento, by: 1) {
            var fraccion = SKSpriteNode(texture: TexturaCielo)
            fraccion.zPosition = -99
            fraccion.position = CGPoint(x: i*fraccion.size.width, y: fraccion.size.height)
            
            self.addChild(fraccion)
        }
        
        
        
    }

    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
