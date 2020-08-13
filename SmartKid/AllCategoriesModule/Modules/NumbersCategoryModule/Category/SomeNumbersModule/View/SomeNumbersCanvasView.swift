//
//  SomeNumbersCanvasView.swift
//  SmartKid
//
//  Created by Fedor Losev on 12/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation
import UIKit

class SomeNumbersCanvasView: UIView {

    // MARK: - Private propery
    private var lines = [SomeNumbersCanvasModel]()
    
    // MARK: - Public propery
    public var strokeColor = UIColor.blue
    public var strokeWidth: Float = 10

    // MARK: - Public func
    public func setStrokeWidth(width: Float) {
        self.strokeWidth = width
    }

    public func setStrokeColor(color: UIColor) {
        self.strokeColor = color
    }

    public func undo() {
        _ = lines.popLast()
        setNeedsDisplay()
    }

    public func clearDraw() {
        lines.removeAll()
        setNeedsDisplay()
    }

    // MARK: - Override func
    override func draw(_ rect: CGRect) {
        super.draw(rect)

        guard let context = UIGraphicsGetCurrentContext() else { return }

        lines.forEach { (line) in
            context.setStrokeColor(line.color.cgColor)
            context.setLineWidth(CGFloat(line.strokeWidth))
            context.setLineCap(.round)
            for (i, p) in line.points.enumerated() {
                if i == 0 {
                    context.move(to: p)
                } else {
                    context.addLine(to: p)
                }
            }
            context.strokePath()
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append(SomeNumbersCanvasModel.init(strokeWidth: strokeWidth, color: strokeColor, points: []))
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.points.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
}
