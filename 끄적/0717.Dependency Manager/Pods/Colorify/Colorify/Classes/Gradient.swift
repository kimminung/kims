
public enum Direction
{
    case leftToRight
    case rightToLeft
    case topToBottom
    case bottomToTop
    case topLeftBottomRight
    case topRightBottomLeft
}

public extension UIView
{
    func addGradient(from: UIColor, to: UIColor, direction: Direction)
    {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [from.cgColor, to.cgColor]
        
        switch direction
        {
        case .leftToRight:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .bottomToTop:
            gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        case .topToBottom:
            gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        case .topLeftBottomRight:
            gradient.startPoint = CGPoint.zero
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        case .topRightBottomLeft:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        }
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}
