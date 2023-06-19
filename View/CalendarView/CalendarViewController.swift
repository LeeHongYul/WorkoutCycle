//
//  CalendarViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/15.
//

import UIKit

class CalendarViewController: BaseViewController {

    @IBOutlet var checkedDatesLabel: UILabel!
    let calendarView = UICalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
        CheckMarkManger.shared.fetcthCheckMark()
        calendarView.reloadInputViews()
    }

//    func checkedDatesCount() {
//        let dateCounts = CheckMarkManger.shared.checkMarkList.count
//
//        checkedDatesLabel.text = "오운완 : \(dateCounts)"
//    }

    func createCalendar() {
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        let section = UICalendarSelectionSingleDate(delegate: self)
        calendarView.selectionBehavior = section
        calendarView.calendar = .current
        calendarView.locale = .current
        calendarView.fontDesign = .rounded
        calendarView.delegate = self

        view.addSubview(calendarView)

        NSLayoutConstraint.activate([
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendarView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}


extension CalendarViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {

        guard let todayDate = dateComponents?.date else { return }

        self.showActionSheet(title: "오운완?", message: "\(todayDate.dateToString()) 운동을 완료합니다.") {
            print("오늘 운동 함")
            CheckMarkManger.shared.addCheckMark(checkedDate: todayDate, isChecked: true)
            CheckMarkManger.shared.fetcthCheckMark()
        } cancelCallback: {
            print("오늘 운동 안함")
        }
    }
}

extension CalendarViewController :UICalendarViewDelegate {
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {

        let checkMarkManager = CheckMarkManger.shared.checkMarkList
        // 날짜에 해당하는 체크마크 데이터를 가져옵니다.
        if checkMarkManager.contains(where: { $0.isChecked && $0.checkedDate == dateComponents.date }) {

            return .image(UIImage(systemName: "checkmark")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal))
        } else {
            return nil
        }
    }

    func calendarView(_ calendarView: UICalendarView, didChangeVisibleDateComponentsFrom previousDateComponents: DateComponents) {
        guard let availableDate = calendarView.visibleDateComponents.month else { return }

        let target = CheckMarkManger.shared.checkMarkList

        let matchingCount = target.filter { $0.isChecked && $0.checkedDate?.month == availableDate }.count

        self.checkedDatesLabel.text = "\(availableDate)월 오운완 \(matchingCount)"
    }
}
