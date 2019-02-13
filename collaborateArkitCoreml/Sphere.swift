//
//  Sphere.swift
//  collaborateArkitCoreml
//
//  Created by 권영호 on 24/01/2019.
//  Copyright © 2019 0ho_kwon. All rights reserved.
//

import Foundation
import SceneKit

class Sphere: SceneObject{
    init() {
        super.init(from: "sphere.dae")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var animating: Bool = false
    
    func animate() {
        if animating { return }
        animating = true
        
        let rotateOne = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi * 2), z: 0, duration: 2.0)
        let repeatFoever = SCNAction.repeatForever(rotateOne)
        
        runAction(repeatFoever)
    }
    
    func rotationWithPercentage(maxDuration: Float, percentage: Float){
        let rotate = SCNAction.rotateBy(x: 0, y: CGFloat(Float.pi * 2), z: 0, duration: TimeInterval(maxDuration * percentage))
        runAction(rotate)
    }
    
    func stopAnimating(){
        removeAllActions()
        animating = false
    }

}
