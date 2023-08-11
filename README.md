# WorkoutCycle

### 프로젝트 소개
운동을 하는 사람들을 위한 앱을 개발했습니다. 이 앱은 사용자가 쉽게 자신의 현재 운동 분할법을 설정하고 매일 어디 부위를 운동을 해야 하는지 쉽게 알 수 있도록 도와줍니다.
  - 기본 분할법을 설정하며, 이후에는 사용자가 원하는 대로 분할법을 커스터마이징할 수 있습니다.
  - 달력을 통해 "오운완"을 기록할 수 있으며, 해당 달에 몇 번의 운동을 완료했는지 확인할 수 있습니다.
  - 운동을 해야 할 시간에 맞춰 해당 부위의 운동을 할 수 있도록 알림을 받을 수 있으며, 알림을 통해 확인할 수 있습니다.
### 개발 기간
- 2023년 06월 ~ 2023년 08월
### 기술 스택
  - Language : Swift
  - Framework : UIKit, CoreData, UserNotifications
  - Library : Then, TagListView, SwiftLint
    
### 기능

<br/>

| <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/6bf903fc-ea98-4d34-835f-3a29daff2aa8"> | <img width="250" height="360" src="https://github.com/LeeHongYul/TIL/assets/117960228/67699c05-ba70-4e5b-9c0b-219d4434ccfe"> | <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/8ef83aa6-d9bd-4ddf-975b-8c4028d09fde"> | <img width="250" height="360" src="https://github.com/LeeHongYul/TIL/assets/117960228/2646781b-d00a-4455-8ce4-dac73fbce3b0"> |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
|  `운동 분할 선택`   |  `운동 루틴 추가`  | `UICalendar을 활용한 오운완 기록하기`  | `Local Notification` | 

<br/>

### UI

  <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/4ae1995f-bf23-49cd-87a4-a6499699feba"> <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/08b443ec-ddda-4445-8601-c2cb3030db50"> <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/9ae81e72-3732-497a-a88c-3f919f618ee8"> <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/ed2b6a84-88c1-4578-9105-538368c521c8"> <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/79160a82-913e-4cd7-98b8-0f07ff5b954a"> <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/43b5be92-9ba0-4bfa-a523-49f2301b0253"> <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/16d91d4d-5e99-4a0c-ab2b-6fb36626811b"> <img width="250" height="360" src="https://github.com/LeeHongYul/WorkoutCycle/assets/117960228/9fcf64ca-63bd-4017-b417-0b95ab3fdff9"> <img width="250" height="360" src="https://github.com/LeeHongYul/TIL/assets/117960228/20a778a5-ea67-4ed4-a4f0-2a1bf633915b">

### 개발 상세
<details>
<summary>배열에서 매일 로테이션을 돌리는 기능 구현</summary>
<div markdown="1">
앱에 처음 접속한 날짜와 최근에 접속한 날짜를 저장하는 기능이 구현되었으므로, 두 날짜 사이의 차이를 계산하고, 설정된 운동 분할법이 저장된 배열의 요소 수로 나누어 로테이션을 돌리면서 매일 다음 운동 부위를 표시하도록 하였습니다.
</div>
</details>

<details>
<summary>Local Notification</summary>
<div markdown="1">
알림을 예약할 날짜와 시간을 나타내는 DateComponents 객체를 생성하며, 사용자가 시간과 분을 설정할 수 있도록 구현했습니다.<br>
UNCalendarNotificationTrigger를 사용하여 알림을 예약하는 트리거(trigger)를 생성했습니다.<br>
이 트리거는 dateComponents에 설정된 날짜와 시간에 알림이 발생하도록 했습니다.<br>
</div>
</details>

<details>
<summary>Calendar에서 Decoration 사용</summary>
<div markdown="1">
캘린더에서 특정 날짜에 이벤트가 있는 경우 해당 날짜 셀을 다른 스타일로 표시하로독 decorationFor 메소드를 사용하였습니다.<br>
UICalendarView는 기본적으로 제공하는 기능이므로, 추가적인 라이브러리나 외부 의존성 없이도 즉시 사용할 수 있어 편리하고 간편했습니다.<br>
</div>
</details>

### 고민 과정
<details>
<summary>뷰 높이를 비율로 설정</summary>
<div markdown="1">
한 화면에 CalenderView와 일반적인 View를 함께 넣고 높이를 설정할 때 약간의 문제가 있었습니다.<br>
View의 높이를 고정하여 설정하면 iPhone SE 시뮬레이터에서 두 개의 뷰가 올바르게 표시되지 않았습니다.<br>
CalenderView의 마지막 주가 잘릴 수 있거나 다른 View 안에 내용이 겹치는 현상이 발생했습니다.<br>

이 문제를 해결하기 위해 뷰의 높이를 비율로 설정하는 방법을 사용했습니다.<br>

```swift
calendarView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.9)
```

이 부분에서 UIView와 뷰의 위치와 크기에 대해 복습할 수 있었습니다.<br>
frame은 슈퍼뷰의 좌표 시스템에서 뷰의 위치와 크기를 나타내고, bounds는 뷰 자체의 좌표 시스템에서 뷰의 위치와 크기를 나타냈습니다다.<br>
따라서 뷰를 이동하거나 변형할 때는 frame을 수정하고, 뷰 내부의 내용을 조정하거나 변형할 때는 bounds를 수정하는 것이 보편적인 사용 방식이였습니다.<br>

또한 제약을 설정할 때 isActive를 한 번에 사용하는 방법도 복습했습니다.<br>

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
UITabBarController와 연결된 뷰들 중에서 새로운 탭으로 이동할 때 해당 뷰의 데이터를 다시 로드해야 하는 상황이 필요했습니다.<br>
초기에는 viewWillAppear 메서드를 사용하려고 생각했지만, TabBar 컨트롤러는 뷰 컨트롤러를 사전에 로드하여 관리하고, 각 탭의 뷰 컨트롤러가 메모리에 남아 있기 때문에 뷰가 그대로 유지되었습니다.<br>

이에 따라 UITabBarControllerDelegate의 didSelect 메서드를 활용하여 문제에 접근하였습니다. FinalViewController에 접근하기 위해 아래 코드를 사용했습니다.<br>

```swift
if let finalViewController = viewController as? FinalViewController
```

위의 코드로는 제대로 실행되지 않았는데, 이유는 FinalViewController가 UINavigationController에 연결되어 있어서 navigation stack의 상단에 있는 뷰를 가져와야 했기 때문이였습니다.<br>
따라서 .topViewController를 사용하여 문제를 해결하였습니다. 이 과정에서 viewController를 UINavigationController로 캐스팅 했습니다.<br>
할 수 있는 이유는 UINavigationController가 UIViewController의 하위 클래스이기 때문입니다.<br>

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
UICalendarView에서 새로운 이벤트를 추가할 때마다 바로 데이터를 다시 로드하기 위해 reloadDecorations(forDateComponents:animated:) 메서드를 활용하였습니다.<br>
이 메서드는 DateComponents 타입의 배열에 현재까지 체크된 날짜를 저장하여 적절한 시기에 데이터를 갱신하는 방식으로 구현되었습니다.<br>
하지만 decoration을 추가할 때는 즉시 적용되었지만, 삭제를 시도할 때는 즉시 실행되지 않았습니다.<br>
이 문제는 주어진 날짜에 대한 장식(데코레이션)을 설정하는 데 사용되는 메소드 'calendarView(_:decorationFor:)'가 언제 호출되는지를 확인하지 못해서 발생한 문제였습니다.<br>
decoration을 제거하고 확인 후 메소드를 호출하니 문제가 해결되었습니다.<br>
</div>
</details>

<details>
<summary>코드의 역할과 책임을 더욱 명확하게 분리</summary>
<div markdown="1">
아래 코드는 CalendarViewController에서 CoreData에 저장된 CheckMark을 제거하기 위한 코드입니다.<br>
CalendarViewController에서 체크된 날짜를 확인한 후 해당 날짜의 CheckMark를 제거하고 있습니다.<br>
그러나 이 부분을 더욱 간결하고 효율적인 방식으로 수정해 보았습니다.<br>

if let removeTarget = target.first { $0.checkedDate == dateComponents?.date } {
    CheckMarkManger.shared.removeCheckMark(checkedDate: removeTarget)
}

func removeCheckMark(checkedDate: CheckMarkEntity) {
    mainContext.delete(checkedDate)
    saveContext()
}
아래 코드에서는 CalendarViewController 대신 CoreDataManager에서 체크된 날짜를 확인한 후 해당 날짜의 CheckMark를 제거하도록 변경하였습니다.<br>
이로써 CalendarViewController는 removeCheckMark 메서드만 호출하여 필요한 기능을 수행하게 되었습니다.<br>
이렇게 함으로써 코드의 역할과 책임을 더욱 명확하게 분리하였습니다.<br>

CheckMarkManger.shared.removeCheckMark(checkedDate: todayDate)

func removeCheckMark(checkedDate: Date) {
    guard let checkMark = checkMarkList.first(where: { $0.checkedDate == checkedDate }) else { return }
    
    checkMarkList = checkMarkList.filter{ $0 != checkMark }
    
    mainContext.delete(checkMark)
    
    saveContext()
}

</div>
</details>

### 성장 과정
- 머리 속에서 필요성에 의해 고민한 것을 실제로 실행하여 스스로에게 칭찬할 만한 일을 해냈다고 생각합니다.
- 해당 프로젝트를 진행하면서 새로운 기능을 배우고 싶다는 열망이 생겨 추가하고 싶은 욕구가 생겼습니다. 이를 통해 더 많은 공부가 필요하다는 것을 깨닫게 되었습니다.
