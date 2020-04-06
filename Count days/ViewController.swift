//
//  ViewController.swift
//  Count days
//
//  Created by Tomohiro Hattori on 2018/07/20.
//  Copyright © 2018 Tomohiro Hattori. All rights reserved.
//

import UIKit
import Foundation

extension Date {
    func differenceInDay(_ date: Date) -> Int {
        let cal = Calendar(identifier: .gregorian)
        let lhs = cal.dateComponents([.year, .month, .day], from: self)
        let rhs = cal.dateComponents([.year, .month, .day], from: date)
        let components = cal.dateComponents([.day], from: lhs, to: rhs)
        return components.day!
    }
}


class ViewController: UIViewController {
    //ラベル定義
    @IBOutlet var label: UILabel!
    @IBOutlet var labelcom: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ///背景画像
        let beautifulImage = UIImage(named: "ss.jpg")
        imageView.image = beautifulImage
    
        ///日付系処理
        let date = Date()//現在時刻取得
        
        ///日付計算１
        let calendar = Calendar.current
        let year = calendar.component(.year, from: date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)
        let year2 = year - 2015
        let year2int:String = String(year2)
        let month2 = 2+year2*12+month
        let month2int:String = String(month2)
        let intmonth:Int = Int(month)
        ///日付計算２
        let startday = Date(timeIntervalSince1970: TimeInterval(60*60*15)+(24*60*60*16708))       // Oct,1,2015
        let ourdays = startday.differenceInDay(date)
        let ourdayss:String = String(ourdays)
        let daythu = ourdays%7
        let day100 = ourdays%100
        let day100s = ourdays/100
        let day100sint:String = String(day100s)
        let day1000 = ourdays%1000
        let day1000s = ourdays/1000
        let day1000sint:String = String(day1000s)
        let week = ourdays / 7
        let weekint:String = String(week)
        let uruu = year / 4
        var yeardays = 0
        
        if month==10 && day==1{
            yeardays += 364 + day
        }else if month == 10{
            yeardays += day
        }else if month == 11{
            yeardays += 31 + day
        }else if month == 12{
            yeardays += 61 + day
        }else if month == 1{
            yeardays += 92 + day
        }else if month == 2{
            yeardays += 123 + day
        }else if month == 3 && uruu == 0{
            yeardays += 152 + day
        }else if month == 3 && uruu != 0{
            yeardays += 151 + day
        }else if month == 4{
            yeardays += 182 + day
        }else if month == 5{
            yeardays += 212 + day
        }else if month == 6{
            yeardays += 243 + day
        }else if month == 7{
            yeardays += 273 + day
        }else if month == 8{
            yeardays += 304 + day
        }else if month == 9{
            yeardays += 335 + day
        }
        
        let tutu = yeardays
        let tutu2:Double = Double( tutu*300/365 )
        print(yeardays)
        ///表示する文字たち
        if day1000 == 0{
            let comment = "㊗️" + day1000sint + "000日記念日😊🎉🎊"
            labelcom.text = comment
            
        }else if day100 == 0{
            let comment = "㊗️" + day100sint + "00日記念日😊🎉🎊"
            labelcom.text = comment
            
        }else if day == 1 && month == 10{
            let comment = "㊗️" + year2int + "years aniversary!!😊🎉🎊"
            labelcom.text = comment
        }else if daythu == 0{
            let comment = "㊗️" + weekint + "weeks aniversary!!😊🎉🎊"
            labelcom.text = comment
        }else if day == 1 {
            let comment = "㊗️" + month2int + "months aniversary!!😊🎉🎊"
            labelcom.text = comment
        }else if month == 7 && day == 7{
            let comment = "㊗️七夕😊🎉🎊"
            labelcom.text = comment
        }else{
            let comment = ""
            labelcom.text = comment
        }
            
        
        
        label.text = ourdayss
        let counter100 = (ourdays-1) % 100
        let counter1000 = ((ourdays-1) % 1000)/10
        
        
        /* --- 角丸四角形を描画 for 100-gray-- */
        let roundRectLayer3 = CAShapeLayer.init()
        let roundRectFrame3 = CGRect.init(x: 40, y: 300, width: 300, height: 5)
        roundRectLayer3.frame = roundRectFrame3
        
        // 輪郭の色
        roundRectLayer3.strokeColor = UIColor.cyan.cgColor
        // 角丸四角形の中の色
        roundRectLayer3.fillColor = UIColor.black.cgColor
        // 輪郭の太さ
        roundRectLayer3.lineWidth = 0
        
        // 角丸四角形を描画
        roundRectLayer3.path = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: roundRectFrame3.size.width, height: roundRectFrame3.size.height), cornerRadius: 8).cgPath
        self.view.layer.addSublayer(roundRectLayer3)
        
        
        
        /* --- 角丸四角形を描画 for 100--- */
        let roundRectLayer = CAShapeLayer.init()
        let roundRectFrame = CGRect.init(x: 40, y: 300, width: counter100*3, height: 5)
        roundRectLayer.frame = roundRectFrame
        
        // 輪郭の色
        roundRectLayer.strokeColor = UIColor.cyan.cgColor
        // 角丸四角形の中の色
        roundRectLayer.fillColor = UIColor.yellow.cgColor
        // 輪郭の太さ
        roundRectLayer.lineWidth = 0
        
        // 角丸四角形を描画
        roundRectLayer.path = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: roundRectFrame.size.width, height: roundRectFrame.size.height), cornerRadius: 8).cgPath
        self.view.layer.addSublayer(roundRectLayer)
        
        
        /* --- 角丸四角形を描画 for 1 yaer-gray-- */
        let roundRectLayer6 = CAShapeLayer.init()
        let roundRectFrame6 = CGRect.init(x: 40, y: 315, width: 300 , height: 5)
        roundRectLayer6.frame = roundRectFrame6
        
        // 輪郭の色
        roundRectLayer6.strokeColor = UIColor.cyan.cgColor
        // 角丸四角形の中の色
        roundRectLayer6.fillColor = UIColor.black.cgColor
        // 輪郭の太さ
        roundRectLayer6.lineWidth = 0
        
        // 角丸四角形を描画
        roundRectLayer6.path = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: roundRectFrame6.size.width, height: roundRectFrame3.size.height), cornerRadius: 8).cgPath
        self.view.layer.addSublayer(roundRectLayer6)
        
        
        
        /* --- 角丸四角形を描画 for 1 year--- */
        let roundRectLayer5 = CAShapeLayer.init()
        let roundRectFrame5 = CGRect.init(x: 40, y: 315, width: tutu2 , height: 5)
        roundRectLayer5.frame = roundRectFrame5
        
        // 輪郭の色
        roundRectLayer5.strokeColor = UIColor.cyan.cgColor
        // 角丸四角形の中の色
        roundRectLayer5.fillColor = UIColor.orange.cgColor
        // 輪郭の太さ
        roundRectLayer5.lineWidth = 0
        
        // 角丸四角形を描画
        roundRectLayer5.path = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: roundRectFrame5.size.width, height: roundRectFrame5.size.height), cornerRadius: 8).cgPath
        self.view.layer.addSublayer(roundRectLayer5)
        
        

        /* --- 角丸四角形を描画 for 1000-gray-- */
        let roundRectLayer4 = CAShapeLayer.init()
        let roundRectFrame4 = CGRect.init(x: 40, y: 330, width: 300, height: 5)
        roundRectLayer4.frame = roundRectFrame4
        
        // 輪郭の色
        roundRectLayer4.strokeColor = UIColor.cyan.cgColor
        // 角丸四角形の中の色
        roundRectLayer4.fillColor = UIColor.black.cgColor
        // 輪郭の太さ
        roundRectLayer4.lineWidth = 0
        
        // 角丸四角形を描画
        roundRectLayer4.path = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: roundRectFrame4.size.width, height: roundRectFrame4.size.height), cornerRadius: 8).cgPath
        self.view.layer.addSublayer(roundRectLayer4)
        
        
        
        /* --- 角丸四角形を描画 for 1000--- */
        let roundRectLayer2 = CAShapeLayer.init()
        let roundRectFrame2 = CGRect.init(x: 40, y: 330, width: counter1000*3, height: 5)
        roundRectLayer2.frame = roundRectFrame2
        
        // 輪郭の色
        roundRectLayer2.strokeColor = UIColor.yellow.cgColor
        // 角丸四角形の中の色
        roundRectLayer2.fillColor = UIColor.red.cgColor
        // 輪郭の太さ
        roundRectLayer2.lineWidth = 0
        
        // 角丸四角形を描画
        roundRectLayer2.path = UIBezierPath.init(roundedRect: CGRect.init(x: 0, y: 0, width: roundRectFrame2.size.width, height: roundRectFrame2.size.height), cornerRadius: 8).cgPath
        
        self.view.layer.addSublayer(roundRectLayer2)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
