//
//  DashLineView.swift
//  RemindMe
//
//  Created by Anbalagan on 01/07/24.
//

import UIKit

final class DashLineView: UIControl {
    private let shapeLayer = CAShapeLayer()
    
    var lineWidth: CGFloat = 1.0 {
        didSet { updateLineWidth() }
    }

    var lineColor: UIColor = .gray {
        didSet { updateLineColor() }
    }
    
    var dashPattern: [NSNumber] = [] {
        didSet { updateDashPattern() }
    }
    
    var cornerRadius: CGFloat = 0.0 {
        didSet { updateCornerRadius() }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        updateShapeLayerBounds()
        updateDashPattern()
        updateLineColor()
        updateLineWidth()
        updateCornerRadius()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialSetup() {
        shapeLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(shapeLayer)
        updateShapeLayerBounds()
        updateDashPattern()
        updateLineColor()
        updateLineWidth()
        updateCornerRadius()
    }
    
    private func updateShapeLayerBounds() {
        shapeLayer.frame = bounds
    }
    
    private func updateDashPattern() {
        shapeLayer.lineDashPattern = dashPattern
    }
    
    private func updateLineColor() {
        shapeLayer.strokeColor = lineColor.cgColor
    }
    
    private func updateLineWidth() {
        shapeLayer.lineWidth = lineWidth
    }
    
    private func updateCornerRadius() {
        shapeLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }
}
