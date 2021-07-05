//
//  ViewController.swift
//  TapitGesture-UserDefault
//
//  Created by DCS on 01/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timeleft = 30
    var score = 0
    var name:String = ""
    private var timer = Timer()
    
    private let myView1:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        //view.frame = CGRect(x: 20, y: 80, width: 70, height:70)
        return view
    }()
    private let myView2:UIView = {
        let view = UIView()
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return view
    }()
    private let myView3:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        return view
    }()
    private let myView4:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        return view
    }()
    private let myView5:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        return view
    }()
    private let myView6:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        return view
    }()
    private let myView7:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        return view
    }()
    private let myView8:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        return view
    }()
    private let myView9:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        view.layer.borderWidth = 3
        view.layer.borderColor =  UIColor.black.cgColor
        return view
    }()
    private let ScoreLbl:UILabel = {
        let label = UILabel()
        label.text = "Score:"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .left
        label.isHidden = true
        label.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        return label
    }()
    private let Score:UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .left
        label.isHidden = true
        label.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return label
    }()

    /*private let btnStart : UIButton = {
        let btn = UIButton()
        btn.setTitle("Start", for: .normal)
        btn.addTarget(self, action: #selector(handlestart), for: .touchUpInside)

        btn.setTitleColor(#colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        btn.layer.cornerRadius = 80
        return btn
    } () */
    private let btnStop : UIButton = {
        let btn = UIButton()
        btn.setTitle("Start", for: .normal)
        btn.addTarget(self, action: #selector(handlestart), for: .touchUpInside)
        //btn.isHidden = true
        btn.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        btn.layer.cornerRadius = 80
        return btn
    } ()
    private let leaderboard : UIButton = {
        let strt = UIButton()
        strt.setTitle("Leaderboard", for: .normal)
        strt.addTarget(self, action: #selector(lead), for: .touchUpInside)
        strt.backgroundColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        strt.setTitleColor(.white, for: .normal)
        return strt
    } ()
    private let timerlabel : UILabel = {
        let label = UILabel()
        label.text = "30"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    @objc private func lead(){
        let ld = LeaderboardVC()
        navigationController?.pushViewController(ld, animated: true)
    }
    
    @objc private func handlestart()
    {
        
        //        UserDefaults.standard.setValue(nil, forKey: "startGame")
        //                print("session clear")
        btnStop.isHidden = true
        //  myTextView.isHidden = true
        ScoreLbl.isHidden = false
        Score.isHidden = false
        timerlabel.isHidden = false
        leaderboard.isHidden = false
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Timerstart), userInfo: .none, repeats: true)
        
    }

/*
 @objc func handlestart(){
        print("Start Clicked....")
        btnStart.isHidden = true
        lblscorelbl.isHidden = false
        lblscore.isHidden = false
        btnStop.isHidden = false
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            
            //replace this with whatever code you want to execute after a delay
            let randomInt = Int.random(in: 1..<10)
            switch randomInt{
                case 1:
                    self.myView1.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                case 2:
                    self.myView2.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)

                case 3:
                    self.myView3.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                case 4:
                    self.myView4.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                case 5:
                    self.myView5.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                case 6:
                    self.myView6.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                case 7:
                    self.myView7.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                case 8:
                    self.myView8.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
                
                default:
                    self.myView9.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)

            }
           
        }
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            self.myView1.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            self.myView2.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            self.myView3.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            self.myView4.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            self.myView5.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            self.myView6.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            self.myView7.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            self.myView8.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            self.myView9.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }
    }
 */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView1)
        view.addSubview(myView2)
        view.addSubview(myView3)
        view.addSubview(myView4)
        view.addSubview(myView5)
        view.addSubview(myView6)
        view.addSubview(myView7)
        view.addSubview(myView8)
        view.addSubview(myView9)
        view.addSubview(ScoreLbl)
        view.addSubview(Score)
        //view.addSubview(btnStart)
        view.addSubview(btnStop)
        let alert = UIAlertController(title: "Rules", message: "Tap On Highlighted Box To Earn +10 Point, If tap On Wrong Box Then lose -5 Point, Tap Within Given Time, Click Start To Begin", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
        
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(didtapgrid1))
        tapgesture.numberOfTapsRequired = 1
        tapgesture.numberOfTouchesRequired = 1
        
        let tapgesture2 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid2))
        tapgesture2.numberOfTapsRequired = 1
        tapgesture2.numberOfTouchesRequired = 1
        
        let tapgesture3 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid3))
        tapgesture3.numberOfTapsRequired = 1
        tapgesture3.numberOfTouchesRequired = 1
        
        let tapgesture4 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid4))
        tapgesture4.numberOfTapsRequired = 1
        tapgesture4.numberOfTouchesRequired = 1
        
        let tapgesture5 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid5))
        tapgesture5.numberOfTapsRequired = 1
        tapgesture5.numberOfTouchesRequired = 1
        
        let tapgesture6 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid6))
        tapgesture6.numberOfTapsRequired = 1
        tapgesture6.numberOfTouchesRequired = 1
        
        let tapgesture7 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid7))
        tapgesture7.numberOfTapsRequired = 1
        tapgesture7.numberOfTouchesRequired = 1
        
        let tapgesture8 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid8))
        tapgesture8.numberOfTapsRequired = 1
        tapgesture8.numberOfTouchesRequired = 1
        
        let tapgesture9 = UITapGestureRecognizer(target: self, action: #selector(didtapgrid9))
        tapgesture9.numberOfTapsRequired = 1
        tapgesture9.numberOfTouchesRequired = 1
        
        
        myView1.addGestureRecognizer(tapgesture)
        myView2.addGestureRecognizer(tapgesture2)
        myView3.addGestureRecognizer(tapgesture3)
        myView4.addGestureRecognizer(tapgesture4)
        myView5.addGestureRecognizer(tapgesture5)
        myView6.addGestureRecognizer(tapgesture6)
        myView7.addGestureRecognizer(tapgesture7)
        myView8.addGestureRecognizer(tapgesture8)
        myView9.addGestureRecognizer(tapgesture9)
        

    
        self.view.backgroundColor = .black
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg5.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        myView1.frame = CGRect(x: 20, y: 80, width: 100, height:100)
        myView2.frame = CGRect(x: view.width - 240, y: 80, width: 100, height: 100)
        myView3.frame = CGRect(x: view.width - 125, y: 80, width: 100, height: 100)
        myView4.frame = CGRect(x: 20, y: myView1.bottom + 20, width: 100, height: 100)
        myView5.frame = CGRect(x: view.width - 240, y: myView2.bottom + 20, width: 100, height: 100)
        myView6.frame = CGRect(x: view.width - 125, y: myView3.bottom + 20, width: 100, height: 100)
        myView7.frame = CGRect(x: 20, y: myView4.bottom + 20, width: 100, height: 100)
        myView8.frame = CGRect(x: view.width - 240, y: myView5.bottom + 20, width: 100, height: 100)
        myView9.frame = CGRect(x: view.width - 125, y: myView6.bottom + 20, width: 100, height: 100)
        btnStop.frame = CGRect(x: 20, y: myView9.bottom + 100, width: view.width - 40, height: 70)
        ScoreLbl.frame = CGRect(x: 20, y: myView9.bottom + 5, width: 150, height: 60)
        Score.frame = CGRect(x: view.width - 230, y: myView9.bottom + 5, width: view.width - 40, height: 60)
        timerlabel.frame = CGRect(x: 20, y: myView9.bottom + 65, width: 80, height: 50)
        leaderboard.frame = CGRect(x: 20, y: timerlabel.bottom + 10, width: view.width - 40, height: 60)
        //btnStart.frame = CGRect(x: 20, y: myView9.bottom + 100, width: view.width - 40, height: 70)


    }
    

}
extension ViewController{

@objc private func didtapgrid1(_ gesture:UITapGestureRecognizer, _ sender:UIView){
    print("Tapped at Location : \(gesture.location(in: sender))")
    if(self.myView1.backgroundColor!.isEqual(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
    {
        self.score += 10
        Score.text = String(score)
    }
    else{
        self.score -= 5
        Score.text = String(score)
    }
    
}


@objc private func didtapgrid2(_ gesture:UITapGestureRecognizer, _ sender:UIView){
    print("Tapped at Location : \(gesture.location(in: sender))")
    if(self.myView2.backgroundColor!.isEqual(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
    {
        self.score += 10
        Score.text = String(score)
    }
    else{
        self.score -= 5
        Score.text = String(score)
    }
    
}

@objc private func didtapgrid3(_ gesture:UITapGestureRecognizer, _ sender:UIView){
    print("Tapped at Location : \(gesture.location(in: sender))")
    if(self.myView3.backgroundColor!.isEqual(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
    {
        self.score += 10
        Score.text = String(score)
    }
    else{
        self.score -= 5
        Score.text = String(score)
    }
    
}
@objc private func didtapgrid4(_ gesture:UITapGestureRecognizer, _ sender:UIView){
    print("Tapped at Location : \(gesture.location(in: sender))")
    if(self.myView4.backgroundColor!.isEqual(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
    {
        self.score += 10
        Score.text = String(score)
    }
    else{
        self.score -= 5
        Score.text = String(score)
    }
    
}

@objc private func didtapgrid5(_ gesture:UITapGestureRecognizer, _ sender:UIView){
    print("Tapped at Location : \(gesture.location(in: sender))")
    if(self.myView5.backgroundColor!.isEqual(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
    {
        self.score += 10
        Score.text = String(score)
    }
    else{
        self.score -= 5
        Score.text = String(score)
    }
    
}

@objc private func didtapgrid6(_ gesture:UITapGestureRecognizer, _ sender:UIView){
    print("Tapped at Location : \(gesture.location(in: sender))")
    if(self.myView6.backgroundColor!.isEqual(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
    {
        self.score += 10
        Score.text = String(score)
    }
    else{
        self.score -= 5
        Score.text = String(score)
    }
    
}

@objc private func didtapgrid7(_ gesture:UITapGestureRecognizer, _ sender:UIView){
    print("Tapped at Location : \(gesture.location(in: sender))")
    if(self.myView7.backgroundColor!.isEqual(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
    {
        self.score += 10
        Score.text = String(score)
    }
    else{
        self.score -= 5
        Score.text = String(score)
    }
    
}

@objc private func didtapgrid8(_ gesture:UITapGestureRecognizer, _ sender:UIView){
    print("Tapped at Location : \(gesture.location(in: sender))")
    if(self.myView8.backgroundColor!.isEqual(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
    {
        self.score += 10
        Score.text = String(score)
    }
    else{
        self.score -= 5
        Score.text = String(score)
    }
    
}

@objc private func didtapgrid9(_ gesture:UITapGestureRecognizer, _ sender:UIView){
    print("Tapped at Location : \(gesture.location(in: sender))")
    if(self.myView9.backgroundColor!.isEqual(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
    {
        //print("yes")
        self.score += 10
        Score.text = String(score)
    }
    else{
        self.score -= 5
        Score.text = String(score)
    }
    
}




@objc private func Timerstart(){
    self.timeleft -= 1
    self.timerlabel.text = String(self.timeleft)
    let randomInt = Int.random(in: 1..<10)
    if( randomInt == 1)
    {
        myView1.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView6.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView8.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView9.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
    }
        
    else if(randomInt == 2)
    {
        myView2.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView6.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView8.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView9.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
    }
    else if(randomInt == 3)
    {
        myView3.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView6.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView8.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView9.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    else if(randomInt == 4)
    {
        myView4.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView6.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView8.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView9.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
    }
    else if(randomInt == 5)
    {
        myView5.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView6.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView8.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView9.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
    }
    else if(randomInt == 6)
    {
        myView6.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView8.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView9.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
    }
    else if(randomInt == 7)
    {
        myView7.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView6.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView8.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
    }
    else if(randomInt == 8)
    {
        myView8.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView6.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView9.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
    }
    else if(randomInt == 9)
    {
        myView9.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView6.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView8.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
    }
    
    if(self.timeleft==0){
        timer.invalidate()
        myView1.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView2.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView3.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView4.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView5.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView6.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView7.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView8.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        myView9.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
        let alert = UIAlertController(title: "Username", message: "Please Enter Your Name", preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "Enter Your Name"}
        
        let action = UIAlertAction(title: "submit", style: .default) { (_) in
            self.name = (alert.textFields?.first?.text)!
            UserDefaults.standard.setValue("sessionkey", forKey: "UserToken")
            UserDefaults.standard.setValue(self.name, forKey: "Name")
            UserDefaults.standard.setValue(self.score, forKey: "Score")
            let vc = LeaderboardVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        alert.addAction(action)
        present(alert , animated: true , completion: nil)
    }
}
}

/*extension ViewController{
    @objc private func didTapView(_ gesture:UITapGestureRecognizer){
        print("Tapped at location: \(gesture.location(in: view))")
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            var location = gesture.location(in: self.view)
            print(location.x)
            if  (location.x >= 20.0 && location.y >= 80.0 && location.x <= 120.0 && location.y <= 180.0 && self.myView1.backgroundColor == #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
            {
            print("view 1")
            }
        
        }
    }
}
*/

