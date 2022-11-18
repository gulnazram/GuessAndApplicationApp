//
//  ViewController.swift
//  Guess
//
//  Created by Gulnaz on 14.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelSum: UILabel!
    @IBOutlet weak var labelRandomTop: UILabel!
    @IBOutlet weak var labelRandomBottom: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        welcomeAlert()
    }
    
    
    @IBAction func buttonSum(_ sender: Any) {
        summationAlert() 
    }

    @IBAction func buttonRandom(_ sender: Any) {
        randomAlert()
    }
    
    private func warningAlert(title: String, message: String, style:UIAlertController.Style) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel) { _ in
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    private func welcomeAlert() {
        let alert = UIAlertController(title: "Добро пожаловать!", message: "Введите ваше имя", preferredStyle: .alert)
        
        alert.addTextField { UITextField in
            UITextField.placeholder = "Имя"
        }
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            if text.isEmpty {
                self.warningAlert(title: "Внимание!", message: "Вы вошли без имени, поэтому будем называть вас Гость", style: .alert)
                self.labelName.text = "Гость"
            } else {
                self.labelName.text = "Привет, " + text + "!"
            }
        }
        
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    private func summationAlert() {
        let alert = UIAlertController(title: "Суммирование", message: "Введите два числа для суммирования", preferredStyle: .alert)
        
        alert.addTextField { UITextField in
            UITextField.placeholder = "Первое число"
      }
        
        alert.addTextField { UITextField in
            UITextField.placeholder = "Второе число"
      }
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let x = Int((alert.textFields?[0].text)!) else {
                self.warningAlert(title: "Предупреждение!", message: "Вводите только числа!", style: .alert)
                return
    }
            guard let y = Int((alert.textFields?[1].text)!) else {
                self.warningAlert(title: "Предупреждение!", message: "Вводите только числа!", style: .alert)
                return
    }
            
            self.labelSum.text = "Результат суммы: \(x * y)"
    }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    
    private func randomAlert() {
        let alert = UIAlertController(title: "Рандомайзер", message: "Введите диапозон случайного числа и ваше число", preferredStyle: .alert)
        
        alert.addTextField { UITextField in
            UITextField.placeholder = "Левая граница диапозона"
        }
        
        alert.addTextField { UITextField in
            UITextField.placeholder = "Правая граница диапозона"
        }
        
        alert.addTextField { UITextField in
            UITextField.placeholder = "Ваше число"
        }
        
        let action = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let lRange = Int((alert.textFields?[0].text)!) else {
                self.warningAlert(title: "Предупреждение!", message: "Вводите только числа!", style: .alert)
                return
    }
        
            guard let rRange = Int((alert.textFields?[1].text)!) else {
                self.warningAlert(title: "Предупреждение!", message: "Вводите только числа!", style: .alert)
                return
    }
    
            guard let number = Int((alert.textFields?[2].text)!) else {
                self.warningAlert(title: "Предупреждение!", message: "Вводите только числа!", style: .alert)
                return
    }
     
            if rRange < lRange {
                self.warningAlert(title: "Внимание!", message: "Введены некоректные значения диапозона", style: .alert)
            } else {
                if number == Int.random(in: lRange ... rRange) {
                    self.labelRandomTop.text = "Поздравляем!"
                    self.labelRandomBottom.text = "Вы угадали число!:)"
                   
                } else {
                    self.labelRandomTop.text = "Не угадали!:("
                }
              }
        }
            alert.addAction(action)
            present(alert, animated: true)
            }
        }
    


