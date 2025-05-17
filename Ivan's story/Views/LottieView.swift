//
//  LottieWrapper.swift
//  Ivan's story
//
//  Created by Alvindo Tri Jatmiko on 14/05/25.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    var animationName: String
       var loopMode: LottieLoopMode = .loop
       var speed: CGFloat = 1.0

       let animationView = LottieAnimationView()

       func makeUIView(context: Context) -> UIView {
           let view = UIView(frame: .zero)

           let animation = LottieAnimation.named(animationName)
           animationView.animation = animation
           animationView.contentMode = .scaleAspectFit
           animationView.loopMode = loopMode
           animationView.animationSpeed = speed
           animationView.play()

           animationView.translatesAutoresizingMaskIntoConstraints = false
           view.addSubview(animationView)

           NSLayoutConstraint.activate([
               animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
               animationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
               animationView.topAnchor.constraint(equalTo: view.topAnchor),
               animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
           ])

           return view
       }

       func updateUIView(_ uiView: UIView, context: Context) {
           // You can control animation updates here if needed
       }}

