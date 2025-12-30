//  ButtonBarViewCell.swift
//  XLPagerTabStrip ( https://github.com/xmartlabs/XLPagerTabStrip )
//
//  Copyright (c) 2017 Xmartlabs ( http://xmartlabs.com )
//
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit

open class ButtonBarViewCell: UICollectionViewCell {

    open var containerView: UIView!
    open var label: UILabel!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        configureAccessibility()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
        configureAccessibility()
    }

    private func setupViews() {
        containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .clear
        contentView.addSubview(containerView)

        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        containerView.addSubview(label)

        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            label.leadingAnchor.constraint(greaterThanOrEqualTo: containerView.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: -8),
            label.topAnchor.constraint(equalTo: containerView.topAnchor),
            label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])

        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .horizontal)
    }

    private func configureAccessibility() {
        isAccessibilityElement = true
        accessibilityTraits.formUnion([.button, .header])
    }
    
    open override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            super.isSelected = newValue
            if (newValue) {
                accessibilityTraits.insert(.selected)
            } else {
                accessibilityTraits.remove(.selected)
            }
        }
    }
}
