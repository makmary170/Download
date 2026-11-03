//
//  ViewController.swift
//  Download
//
//  Created by Мария Макарова on 02.11.2026.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!
    lazy private var downloader = Downloader()

    override func viewDidLoad() {
        super.viewDidLoad()
        downloader.delegate = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        downloader.downloadLargeFile()
    }

    func updateProgressBar() {
        let progressSteps: [Float] = [0.25, 0.50, 0.75, 1]
        for step in progressSteps {
            DispatchQueue.main.async { [self] in
                progressBar.setProgress(step, animated: true)
            }
            sleep(3)
        }
    }

    func showAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Загрузка файла",message: "Загрузка завершена!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
    }

    func cleanProgressBar() {
        DispatchQueue.main.async {
            self.progressBar.setProgress(0, animated: true)
        }
    }
}
