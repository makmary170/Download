//
//  Downloader.swift
//  Download
//
//  Created by Мария Макарова on 02.11.2026.
//

import UIKit

final class Downloader {
    weak var delegate: ViewController?
    var isCancel: Bool = false

    func downloadLargeFile() {
        // Загружаем большой файл частями

        DispatchQueue.global().async {
            var remainingTime: TimeInterval = 12
            let downloadTime: TimeInterval = 3
            let progressSteps: [Float] = [0.25, 0.50, 0.75, 1]

            for step in progressSteps {
                guard self.isCancel == false else { return }

                sleep(UInt32(downloadTime))
                let randomSpeed = Double.random(in: 5...10).rounded()
                remainingTime -= downloadTime

                guard self.isCancel == false else { return }

                self.delegate?.updateProgressBar(to: step, speed: randomSpeed, remainingTime: remainingTime)
            }

            guard self.isCancel == false else { return }

            self.delegate?.showAlert()
            self.delegate?.cleanProgressBar()
        }
    }
}
