
import UIKit

class BottomAlignedLabel: UILabel {
    
    override func drawText(in rect: CGRect) {
        let labelRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        let bottomOffset = max(0, rect.size.height - labelRect.size.height)
        super.drawText(in: rect.offsetBy(dx: 0, dy: bottomOffset))
    }
}
