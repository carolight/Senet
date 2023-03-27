//
//  File.swift
//  
//
//  Created by Caroline Begbie on 27/3/2023.
//

import Foundation

struct Uniforms {
  var modelMatrix = float4x4.identity
  var viewMatrix = float4x4.identity
  var projectionMatrix = float4x4.identity
  var normalMatrix = float3x3.identity
  var shadowProjectionMatrix = float4x4.identity
  var shadowViewMatrix = float4x4.identity
}

struct Params {
  var width: UInt32 = 0
  var height: UInt32 = 0
  var tiling: UInt32 = 0
  var lightCount: UInt32 = 0
  var cameraPosition: float3 = .zero
}

enum Attributes: Int {
  case Position = 0,
  Normal = 1,
  UV = 2,
  Color = 3,
  Tangent = 4,
  Bitangent = 5
}

enum BufferIndices: Int {
  case VertexBuffer = 0,
  UVBuffer = 1,
  ColorBuffer = 2,
  TangentBuffer = 3,
  BitangentBuffer = 4,
  UniformsBuffer = 11,
  ParamsBuffer = 12,
  LightBuffer = 13,
  MaterialBuffer = 14
}

enum TextureIndices: Int {
  case BaseColor = 0,
  NormalTexture = 1,
  RoughnessTexture = 2,
  MetallicTexture = 3,
  AOTexture = 4,
  ShadowTexture = 5
}

enum LightType: Int {
  case unused = 0,
  Sun = 1,
  Spot = 2,
  Point = 3,
  Ambient = 4
}

struct Light {
  var position: float3 = .zero
  var color: float3 = .zero
  var specularColor: float3 = .zero
  var attenuation: float3 = .zero
  var type: UInt8 = LightType.unused.index
  var coneAngle: Float = 0
  var coneDirection: float3 = .zero
  var coneAttenuation: Float = 0
}

struct Material {
  var baseColor: float3 = .zero
  var specularColor: float3 = .zero
  var roughness: Float = 0
  var metallic: Float = 0
  var ambientOcclusion: Float = 0
  var shininess: Float = 0
}

enum RenderTarget: Int {
  case RenderTargetAlbedo = 1,
  RenderTargetNormal = 2,
  RenderTargetPosition = 3
}

extension Attributes {
  var index: Int {
    return Int(rawValue)
  }
}

extension BufferIndices {
  var index: Int {
    return Int(rawValue)
  }
}

extension TextureIndices {
  var index: Int {
    return Int(rawValue)
  }
}

extension RenderTarget {
  var index: Int {
    return Int(rawValue)
  }
}

extension LightType {
  var index: UInt8 {
    return UInt8(rawValue)
  }
}
