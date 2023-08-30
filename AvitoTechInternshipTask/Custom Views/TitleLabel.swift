//
//  TitleLabel.swift
//  AvitoTechInternshipTask
//
//  Created by Mila B on 29.08.2023.
//

import UIKit

class TitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, weight: UIFont.Weight, color: UIColor) {
        super.init(frame: .zero)
        self.textColor = color
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        configure()
    }
    
    
    private func configure() {
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
}
