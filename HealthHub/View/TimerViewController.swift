//
//  TimerViewController.swift
//  HealthHub
//
//  Created by Batu Akdoğan on 27.10.2023.
//

import UIKit

class TimerViewController: UIViewController {

    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var viewModel = TimerViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.timerTick = { [weak self] in
                    // Zaman etiketini güncelleyin
                    self?.updateTimeLabel()
                }

    }
    
    
    @IBAction func startButtonTapped(_ sender: Any) {
        viewModel.startTimer()

    }
    
    
    
    @IBAction func stopButtonTapped(_ sender: Any) {
        viewModel.stopTimer()

    }
    
    
    func updateTimeLabel() {
            timeLabel.text = "\(Int(viewModel.currentTime)) SANİYE"
        
        }
    
    

    @IBAction func resetButtonTapped(_ sender: Any) {
        
        viewModel.resetTimer()

    }
    

}
