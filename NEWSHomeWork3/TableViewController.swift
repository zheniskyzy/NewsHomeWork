//
//  TableViewController.swift
//  NEWSHomeWork3
//
//  Created by Madina Olzhabek on 20.12.2023.
//

import UIKit

class TableViewController: UITableViewController {

    var arrayNews = [News(name: "Суд над экс-директором аэропорта Алматы: защита потребовала отвода судьи", descriptions: "11 декабря прокурор по делу ходатайствовал о том, чтобы изменить обвинительный акт. 14 декабря суд удовлетворил эту просьбу и прокурор представил новый акт. Его объем значительно вырос с 33 до около 240 страниц. Защита утверждает, что им не дали времени ознакомиться с новыми материалами обвинения.", image: "директор"),
    News(name: "Казахстанец создает десерты в отеле, где останавливаются Бейонсе и Канье Уэст", descriptions: "24-летний казахстанец Нариман Абдыгаппаров несмотря на довольно юный возраст, уже имеет внушительный опыт за плечами. Отучившись в лучших школах кулинарии мира, он работает су-шефом в отеле Atlantis The Royal в Дубае, где создает эксклюзивные десерты. Алматинец поделился с Tengritravel.kz своим опытом, впечатлениями, а также тонкостями профессии.", image: "десерт"),
    News(name: "Сингапурец посетил Казахстан и влюбился в горы и баурсаки", descriptions: "Горнолыжные курорты в окрестностях города привлекают внимание как местных жителей, так и иностранных гостей. Недавно 32-летний выходец из Сингапура Хафиз Юсоф посетил знаменитый горнолыжный курорт и поделился своими впечатлениями о визите в Казахстан с корреспондентом редакции Tengritravel.kz.", image: "сингапурец"),
    News(name: "Сергек в Алматы будет фиксировать новые виды нарушений", descriptions: "Все фиксации будут осуществляться в соответствии со статьей 600 КоАП Непредоставление преимущества в движении пешеходам или иным участникам дорожного движения.К примеру, если автомобиль проехал после пешехода, это не считается нарушением правил дорожного движения. Однако если водитель не уступил дорогу пешеходу и не остановился, ему будет выписан штраф. Также будет зафиксировано административное правонарушение, если как пешеход, так и транспортное средство находятся в одной зоне пересечения.", image: "сергек")]

    var time = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
            tableView.reloadData()
    }

    @objc func countTime(){
        arrayNews.insert(arrayNews[3], at: 0)
        tableView.reloadData()
    }
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayNews.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let labelName = cell.viewWithTag(100) as! UILabel
        labelName.text = arrayNews[indexPath.row].name
        let labelDes = cell.viewWithTag(101) as! UILabel
        labelDes.text = arrayNews[indexPath.row].descriptions
        let image = cell.viewWithTag(102) as! UIImageView
        image.image = UIImage(named: arrayNews[indexPath.row].image)
        // Configure the cell...
        let dateFormatter = DateFormatter()
        let todayDate = Date()
        dateFormatter.dateFormat = "dd.MM.y HH:mm:ss"
        let formattedDate = dateFormatter.string(from: todayDate)
        let labelDate = cell.viewWithTag(103) as! UILabel
        labelDate.text = String(formattedDate)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 446
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
