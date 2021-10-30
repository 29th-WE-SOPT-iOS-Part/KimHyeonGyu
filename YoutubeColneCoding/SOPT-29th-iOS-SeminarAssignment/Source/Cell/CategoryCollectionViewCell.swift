//
//  CategoryCollectionViewCell.swift
//  SOPT-29th-iOS-SeminarAssignment
//
//  Created by kimhyungyu on 2021/10/29.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - @IBOutlet Properties
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    // MARK: - Cell Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    // MARK: - Methods
    
    private func setUI() {
        borderView.layer.cornerRadius = 15
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
        borderView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
    }
    
    func sizeFittingWith(cellHeight: CGFloat, text: String) -> CGSize {
        categoryLabel.text = text
        
        // ✅ systemLayoutSizeFitting 메서드 파라미터에 필요한 targetSize(선호하는 사이즈)를 만들어보자.
        // ✅ width 의 경우, intrincsicContentSize 에 딱 맞도록 최소 크기를 위해서 layoutFittingCompressedSize(최소크기) 를 사용해서 설정.
        // ✅ height 의 경우, 파라미터로 받아온 고정 값 설정.
        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: cellHeight)
        
        // ✅ targetSize 를 만들어주었으니 선호하는 사이즈를 명시할 수 있겠죠!
        // ✅ horizontal constraints(너비)는 contentView 에 따라서 늘어나야하기 때문에 우선순위가 낮고 최대한 targetSize 와 가까운 값을 얻는 fittingSizeLevel 로 설정.
        // ✅ vertical constraints(높이)는 targetSize 에 맞춰야하니 우선순위가 가장 높은 required 로 설정.
        return self.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
    }
    
    func setDataWith(categoryText: String) {
        categoryLabel.text = categoryText
    }

}
