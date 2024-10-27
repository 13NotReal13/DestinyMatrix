//
//  HomeView.swift
//  DestinyMatrix
//
//  Created by Иван Семикин on 27/10/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var rotationAngle: Double = 0

    var body: some View {
        ZStack {
            Image(.background)
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Матрица Судьбы")
                    .font(.custom("Avenir Next", size: 36)) // Замените "MagicFont" на название вашего шрифта
                    .foregroundColor(.white)
                    .shadow(color: .purple.opacity(0.7), radius: 5, x: 0, y: 0) // Добавляет магическое свечение
                    .padding(.bottom, 20)
                
                ZStack {
                    Image(.lightAround4)
                        .resizable()
                        .frame(width: 285, height: 285)
                        .rotationEffect(.degrees(rotationAngle), anchor: .center)
                        .onAppear {
                            withAnimation(Animation.linear(duration: 100).repeatForever(autoreverses: false)) {
                                rotationAngle = 360
                            }
                        }
                    
                    Rotating3DSphereView()
                        .frame(width: 300, height: 300)
                }
                
                Spacer()
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Рассчитать матрицу")
                        .padding()
                        .frame(width: UIScreen.main.bounds.width * 0.5)
                        .background(.colorButton)
                        .clipShape(.rect(cornerRadius: 40))
                        .foregroundStyle(.white)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.white, lineWidth: 1)
                        }
                }
                
                Spacer()
                Spacer()
            }
        }
    }
}

import SceneKit

struct Rotating3DSphereView: UIViewRepresentable {
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
        material.diffuse.contents = UIImage(named: "Shape")
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

#Preview {
    HomeView()
}
