//
//  fd.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 28/10/2024.
//

import SwiftUI
import SceneKit

struct Rotating3DSphereView: UIViewRepresentable {
    let imageName: String
    
    func makeUIView(context: Context) -> SCNView {
        // Создание сцены
        let sceneView = SCNView()
        let scene = SCNScene()
        sceneView.scene = scene
        sceneView.allowsCameraControl = false
        sceneView.backgroundColor = .clear
        
        // Создание сферы
        let sphere = SCNSphere(radius: 1.0)
        
        // Настройка материалов сферы
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: self.imageName)
        sphere.materials = [material]
        
        // Создание узла со сферой
        let sphereNode = SCNNode(geometry: sphere)
        scene.rootNode.addChildNode(sphereNode)
        
        // Анимация вращения
        let rotation = CABasicAnimation(keyPath: "rotation")
        rotation.fromValue = SCNVector4(0, 1, 0, 0)
        rotation.toValue = SCNVector4(0, 1, 0, Float.pi * 2)
        rotation.duration = 100 // Длительность полного оборота
        rotation.repeatCount = .infinity
        sphereNode.addAnimation(rotation, forKey: "rotation")
        
        return sceneView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}
}
