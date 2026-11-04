//
//  ViewController.swift
//  Download
//
//  Created by Мария Макарова on 02.11.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var progressBar: UIProgressView!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak private var remainingTimeLabel: UILabel!
    @IBOutlet weak private var cancelButton: UIButton!

    lazy private var downloader = Downloader()

    @IBAction func didTapCancel(_ sender: Any) {
        downloader.isCancel = true
        self.cleanProgressBar()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        downloader.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        downloader.downloadLargeFile()
    }

    func updateProgressBar(to value: Float, speed: Double, remainingTime: TimeInterval) {
        DispatchQueue.main.async {
            self.progressBar.setProgress(value, animated: true)
            self.speedLabel.text = "\(speed) kb/s"
            self.remainingTimeLabel.text = "\(remainingTime) seconds"
        }
    }

    func showAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Загрузка файла",message: "Загрузка завершена!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            self.cancelButton.isHidden = true

        }
    }

    func cleanProgressBar() {
        DispatchQueue.main.async {
            self.progressBar.setProgress(0, animated: true)
            self.cancelButton.isHidden = true
            self.speedLabel.text = nil
            self.remainingTimeLabel.text = nil
        }
    }
}
