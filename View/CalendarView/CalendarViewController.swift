//
//  CalendarViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/15.
//

import UIKit
import Then

class CalendarViewController: BaseViewController {

    let calendarView = UICalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
        CheckMarkManger.shared.fetchCheckMark()
        calendarView.reloadInputViews()
        view.addSubview(countLabel)

        countLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        countLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: 0).isActive = true
        countLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }

    var countLabel = UILabel().then {
        $0.text = "오운완 기록"
        $0.font = UIFont.boldSystemFont(ofSize: 17)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textAlignment = .center
    }

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
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
}


extension CalendarViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {

        calendarView(calendarView, didChangeVisibleDateComponentsFrom: dateComponents!)

        guard let todayDate = dateComponents?.date else { return }

        if !CheckMarkManger.shared.checkMarkList.contains(where: { $0.checkedDate == todayDate}) {
            self.showActionSheet(title: "오운완?", message: "오늘 운동을 완료합니다.", confrimStyle: .default) {
                CheckMarkManger.shared.fetchCheckMark()
                CheckMarkManger.shared.addCheckMark(checkedDate: todayDate)

                let target = CheckMarkManger.shared.checkMarkList
                let targetArray = target.map { Calendar.current.dateComponents([.year, .month, .day], from: $0.checkedDate!)}

                self.calendarView.reloadDecorations(forDateComponents: targetArray, animated: true)

            } cancelCallback: {
                print("취소")
            }
        } else {
            self.showActionSheet(title: "오운완을 취소합니다", message: "운동 취소합니다.", confrimStyle: .destructive) {
                CheckMarkManger.shared.fetchCheckMark()
                let target = CheckMarkManger.shared.checkMarkList

                let targetArray = target.map { Calendar.current.dateComponents([.year, .month, .day], from: $0.checkedDate!)}

                CheckMarkManger.shared.removeCheckMark(checkedDate: todayDate)

//                if let removeTarget = target.first { $0.checkedDate == dateComponents?.date} {
//                    CheckMarkManger.shared.removeCheckMark(checkedDate: removeTarget)
//                }

                self.calendarView.reloadDecorations(forDateComponents: targetArray, animated: false)

            } cancelCallback: {
                print("취소")
            }
        }
    }
}

extension CalendarViewController :UICalendarViewDelegate {

    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        let checkMarkManager = CheckMarkManger.shared.checkMarkList

        if checkMarkManager.contains(where: { $0.checkedDate == dateComponents.date }) {
            return .image(UIImage(systemName: "checkmark.circle.fill")?.withTintColor(.systemGreen, renderingMode: .alwaysOriginal))
        } else {
            return nil
        }
    }

    func calendarView(_ calendarView: UICalendarView, didChangeVisibleDateComponentsFrom previousDateComponents: DateComponents) {
        guard let availableDate = calendarView.visibleDateComponents.month else { return }

        let target = CheckMarkManger.shared.checkMarkList

        let matchingCount = target.filter { $0.checkedDate?.month == availableDate }.count

        countLabel.text = "\(availableDate) 월 오운완 \(matchingCount) 번"
    }
}
