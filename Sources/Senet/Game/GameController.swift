//
//  GameController.swift
//  TestSenet
//
//  Created by Caroline Begbie on 27/3/2023.
//

import MetalKit

public class GameController: NSObject {
  public var scene: GameScene?
  var renderer: Renderer
  var fps: Double = 0
  var deltaTime: Double = 0
  var lastTime: Double = CFAbsoluteTimeGetCurrent()

  public init(metalView: MTKView) {
    renderer = Renderer(metalView: metalView)
    super.init()
    metalView.delegate = self
    fps = Double(metalView.preferredFramesPerSecond)
  }
}

extension GameController: MTKViewDelegate {
  public func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    scene?.update(size: size)
    renderer.mtkView(view, drawableSizeWillChange: size)
  }

  public func draw(in view: MTKView) {
    let currentTime = CFAbsoluteTimeGetCurrent()
    let deltaTime = (currentTime - lastTime)
    lastTime = currentTime
    scene?.update(deltaTime: Float(deltaTime))
    guard let scene else { return }
    renderer.draw(scene: scene, in: view)
  }
}
