//
//  ViewController.swift
//  TodoList
//
//  Created by 이지수 on 2022/01/30.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var tasks = [Task]()  {
        didSet { // 프로퍼티 옵저버, tasks 배열에 할일이 추가될 때마다 유저 디폴트에 할일이 저장됨
            self.saveTasks()
        }
    }// Task 배열 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.loadTasks() // 유저디폴츠에 저장된 할일을 앱을 껏다 켜도 다시 불러와주는것
        
    }

    @IBAction func tapeditButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func tapAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할 일 등록", message: "할 일을 입력해주세요.", preferredStyle: .alert)
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            //등록버튼을 눌럿을때 텍스트필드에 있는 값을 가져올 수 있다.
            // textFields는 배열인데, 우리는 하나만 넣어놧기 때문에 [0]로 접근했음.
            self?.tableView.reloadData() // add된 할일들을 테이블뷰에 새로새로 업로드해주는 것
        })
        let cancelButton = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 일을 입력해주세요." })
        self.present(alert, animated: true, completion: nil)
    
    }
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else { return }
        self.tasks = data.compactMap{
            guard let title = $0["title"] as? String else { return nil }
            guard let done = $0["done"] as? Bool else { return nil }
            return Task(title: title, done: done)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // 사용하지 않는 메모리를 낭비하지 않기 위해서 dequeueResusableCell을 이용해서 셀을 재사용 하는 것
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        
        // 셀 표시됐을 때 체크마크 표시되게 하는 코드
        if task.done {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    // 메서드 정의 : 셀을 선택하였을 때 어떤 셀이 선택되었는지 알려주는 메서드 : didSelectRowAt
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // tasks 배열 요소에 접근해서, done이 true이면 false가 되게 만들어주고, false면 true 가 되게 만들어줄 것.
        var task = self.tasks[indexPath.row]
        task.done = !task.done   // 반대가 되게해줌
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
