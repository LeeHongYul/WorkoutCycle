//
//  CalendarViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/15.
//

import UIKit

extension Notification.Name {
    static let removeCheck = Notification.Name(rawValue: "removeCheck")
}

class CalendarViewController: BaseViewController {

    let calendarView = UICalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        createCalendar()
        CheckMarkManger.shared.fetchCheckMark()
        calendarView.reloadInputViews()

        NotificationCenter.default.addObserver(forName: .removeCheck, object: nil, queue: .main) { _ in
            CheckMarkManger.shared.fetchCheckMark()
            let target = CheckMarkManger.shared.checkMarkList
            let targetArray = target.map { Calendar.current.dateComponents([.year, .month, .day], from: $0.checkedDate!)}
            print(targetArray)

            self.calendarView.reloadDecorations(forDateComponents: targetArray, animated: true)
            self.calendarView.layoutIfNeeded()//되나
            print("노피 되냐?")
        }
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
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
            calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calendarView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.9)
        ])
    }
}


extension CalendarViewController: UICalendarSelectionSingleDateDelegate {
    func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {

        guard let todayDate = dateComponents?.date else { return }

        if !CheckMarkManger.shared.checkMarkList.contains(where: { $0.checkedDate == todayDate}) {
            self.showActionSheet(title: "오운완?", message: "오늘 운동을 완료합니다.") {
                CheckMarkManger.shared.addCheckMark(checkedDate: todayDate)
                let target = CheckMarkManger.shared.checkMarkList
                let targetArray = target.map { Calendar.current.dateComponents([.year, .month, .day], from: $0.checkedDate!)}

                self.calendarView.reloadDecorations(forDateComponents: targetArray, animated: true)
            } cancelCallback: {
                print("취소")
            }

        } else {
            self.showActionSheet(title: "오운완을 취소합니다", message: "운동 취소합니다.") {
                CheckMarkManger.shared.removeCheckMark(checkedDate: todayDate)

                CheckMarkManger.shared.fetchCheckMark()
                let target = CheckMarkManger.shared.checkMarkList

                let targetArray = target.map { Calendar.current.dateComponents([.year, .month, .day], from: $0.checkedDate!)}

                NotificationCenter.default.post(name: .removeCheck, object: nil)

                //                self.calendarView.reloadDecorations(forDateComponents: targetArray, animated: true)
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

        self.navigationItem.title = "\(availableDate) 월 오운완 \(matchingCount) 번"

    }
}
