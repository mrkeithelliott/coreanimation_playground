import Foundation

public class CountDownFormatter: NSFormatter{
    let numberFormmatter = NSNumberFormatter()
    
    public override init() {
        super.init()
        numberFormmatter.numberStyle = .DecimalStyle
        numberFormmatter.maximumFractionDigits = 0
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func stringForObjectValue(obj: AnyObject) -> String? {
        let double_val: Double? = obj as? Double
            
        if (double_val != nil){
            return numberFormmatter.stringFromNumber(NSNumber(double: double_val!))
        }
        
        return "0"
    }
    
    public override func getObjectValue(obj: AutoreleasingUnsafeMutablePointer<AnyObject?>, forString string: String, errorDescription error: AutoreleasingUnsafeMutablePointer<NSString?>) -> Bool {
        
        if let num_val = numberFormmatter.numberFromString(string){
            if obj.memory != nil{
                obj.memory = num_val.doubleValue
            }
            return true
        }
        
        if error.memory != nil{
            error.memory = "Error converting into a double"
        }
        return false
    }
}