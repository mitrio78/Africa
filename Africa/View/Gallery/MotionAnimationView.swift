//
//  MotionAnimationView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct MotionAnimationView: View {

    // MARK: - Properties

    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false

    //MARK: - Methods

    // 1. Random coord
    func randomCoords(max: CGFloat) -> CGFloat{
        return CGFloat.random(in: 0...max)
    }
    // 2. Random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    // 3. Random scale
    func randomScale() -> CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. Random speed
    func randomSpeed() -> Double {
        Double.random(in: 0.025...1.0)
    }
    // 5. Random delay
    func randomDelay() -> Double {
        Double.random(in: 0...2)
    }

    // MARK: - Body

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(
                            width: randomSize(),
                            height: randomSize(),
                            alignment: .center
                        )
                        .scaleEffect(randomScale())
                        .position(
                            x: randomCoords(max: geometry.size.width),
                            y: randomCoords(max: geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()),
                            value: isAnimating
                        )
                        .onAppear {
                            isAnimating = true
                        }
                } //: Repeat
            } //: ZStack
            .drawingGroup()
        } //: Geometry
    }
}

// MARK: - Previews

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
