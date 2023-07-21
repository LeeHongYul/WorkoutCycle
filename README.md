# WorkoutCycle

### Description
- 기간
- 사용 기술
  - Language : Swift
  - Framework : UIKit, CoreData, UICalendar, UserNotifications
  - Library : Then, TagListView

### Implementation
  #### Feature
  
  ### UI

### Challenges
<details>
<summary>뷰 높이를 비율로 설정</summary>
<div markdown="1">
한 화면에 CalenderView와 일반적인 View를 함께 넣고 높이를 설정할 때 약간의 문제가 있었다.<br>
View의 높이를 고정하여 설정하면 iPhone SE 시뮬레이터에서 두 개의 뷰가 올바르게 표시되지 않았다.<br>
CalenderView의 마지막 주가 잘릴 수 있거나 다른 View 안에 내용이 겹치는 현상이 발생했다.<br>

이 문제를 해결하기 위해 뷰의 높이를 비율로 설정하는 방법을 사용했다.<br>

```swift
calendarView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.9)
```

이 부분에서 UIView와 뷰의 위치와 크기에 대해 복습할 수 있었다.<br>
frame은 슈퍼뷰의 좌표 시스템에서 뷰의 위치와 크기를 나타내고, bounds는 뷰 자체의 좌표 시스템에서 뷰의 위치와 크기를 나타냈다.<br>
따라서 뷰를 이동하거나 변형할 때는 frame을 수정하고, 뷰 내부의 내용을 조정하거나 변형할 때는 bounds를 수정하는 것이 보편적인 사용 방식이다.<br>

또한 제약을 설정할 때 isActive를 한 번에 사용하는 방법도 복습했다.<br>

```swift
NSLayoutConstraint.activate([
    calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
    calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10),
    calendarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    calendarView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.9)
])
```
</div>
</details>

<details>
<summary>UITabBarController, UINavigationController에 대한 이해</summary>
<div markdown="1">
  개인 프로젝트에서 UITabBarController와 연결된 뷰들 중에서 새로운 탭으로 이동할 때 해당 뷰의 데이터를 다시 로드해야 하는 상황이 발생했다.<br>
초기에는 viewWillAppear 메서드를 사용하려고 생각했지만, TabBar 컨트롤러는 뷰 컨트롤러를 사전에 로드하여 관리하고, 각 탭의 뷰 컨트롤러가 메모리에 남아 있기 때문에 뷰가 그대로 유지되었다.<br>

이에 따라 UITabBarControllerDelegate의 didSelect 메서드를 활용하여 문제에 접근하였다. FinalViewController에 접근하기 위해 아래 코드를 사용했다.<br>

```swift
if let finalViewController = viewController as? FinalViewController
```

위의 코드로는 제대로 실행되지 않았는데, 이유는 FinalViewController가 UINavigationController에 연결되어 있어서 navigation stack의 상단에 있는 뷰를 가져와야 했기 때문이다.<br>
따라서 .topViewController를 사용하여 문제를 해결하였다. 이 과정에서 viewController를 UINavigationController로 캐스팅 했다.<br>
할 수 있는 이유는 UINavigationController가 UIViewController의 하위 클래스이기 때문이다.<br>

```swift
if let finalWorkCycleViewController = (viewController as? UINavigationController)?.topViewController as? FinalWorkCycleViewController {

}
```
</div>
</details>

<details>
<summary>Local Notifications 권한 거부</summary>
<div markdown="1">
로컬 알림에서 권한을 다시 거부 상태로 변경하려고 했더니 코드로 직접 변경할 수 있는 방법이 없다는 것을 깨달았다.<br>
사용자의 동의를 받지 않으면 권한 상태를 변경할 수 없기 때문이다.<br>
사용자의 권한을 "denied"로 설정하려면 앱의 설정으로 이동하여 사용자에게 직접 권한을 비활성화하도록 안내해야 했다.<br>

따라서 권한을 "denied"로 설정하려면, 사용자를 앱 설정 화면으로 안내하는 로직을 구현해야 했다.<br>
예를 들어, 앱이 필요한 권한이 거부된 경우에는 사용자에게 메시지를 표시하고 앱 설정 화면으로 이동하도록 유도할 수 있었다.<br>
하지만 직접적으로 권한 상태를 변경할 수는 없었다.<br>
그러므로 UISwitch를 사용하여 설정 화면으로 이동할 수 있도록 구현하였다.<br>
</div>
</details>

<details>
<summary>Calendar의 decoration을 클릭했을 때 즉시 사라지지 않는 문제</summary>
<div markdown="1">
UICalendarView에서 새로운 이벤트를 추가할 때마다 바로 데이터를 다시 로드하기 위해 reloadDecorations(forDateComponents:animated:) 메서드를 활용하였다.<br>
이 메서드는 DateComponents 타입의 배열에 현재까지 체크된 날짜를 저장하여 적절한 시기에 데이터를 갱신하는 방식으로 구현되었다.<br>
하지만 decoration을 추가할 때는 즉시 적용되었지만, 삭제를 시도할 때는 즉시 실행되지 않았다.<br>
이 문제는 주어진 날짜에 대한 장식(데코레이션)을 설정하는 데 사용되는 메소드 'calendarView(_:decorationFor:)'가 언제 호출되는지를 확인하지 못해서 발생한 문제였다.<br>
decoration을 제거하고 확인 후 메소드를 호출하니 문제가 해결되었다.<br>
</div>
</details>

<details>
<summary>코드의 역할과 책임을 더욱 명확하게 분리</summary>
<div markdown="1">
아래 코드는 CalendarViewController에서 CoreData에 저장된 CheckMark을 제거하기 위한 코드이다.<br>
CalendarViewController에서 체크된 날짜를 확인한 후 해당 날짜의 CheckMark를 제거하고 있다.<br>
그러나 이 부분을 더욱 간결하고 효율적인 방식으로 수정해 보았다.<br>

if let removeTarget = target.first { $0.checkedDate == dateComponents?.date } {
    CheckMarkManger.shared.removeCheckMark(checkedDate: removeTarget)
}

func removeCheckMark(checkedDate: CheckMarkEntity) {
    mainContext.delete(checkedDate)
    saveContext()
}
아래 코드에서는 CalendarViewController 대신 CoreDataManager에서 체크된 날짜를 확인한 후 해당 날짜의 CheckMark를 제거하도록 변경하였다.<br>
이로써 CalendarViewController는 removeCheckMark 메서드만 호출하여 필요한 기능을 수행하게 되었다.<br>
이렇게 함으로써 코드의 역할과 책임을 더욱 명확하게 분리하였다.<br>

CheckMarkManger.shared.removeCheckMark(checkedDate: todayDate)

func removeCheckMark(checkedDate: Date) {
    guard let checkMark = checkMarkList.first(where: { $0.checkedDate == checkedDate }) else { return }
    
    checkMarkList = checkMarkList.filter{ $0 != checkMark }
    
    mainContext.delete(checkMark)
    
    saveContext()
}

</div>
</details>

