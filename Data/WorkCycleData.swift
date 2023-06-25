//
//  WorkCycleData.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import Foundation

struct WorkCycle {
    let workPart: String
    let workImage: String
}

let cycleList = ["2분할", "3분할", "4분할", "5분할"]

let addWorkCycleList = ["휴식", "스트렝스", "근비대", "자율운동", "크로스핏", "가슴", "등", "팔", "이두", "삼두", "어깨", "상체", "하체", "전면하체", "후면하체"]

let twoCycleList   = [
    WorkCycle(workPart: "상체", workImage: "upperBody"),
    WorkCycle(workPart: "하체", workImage: "lowerBody")
]

let threeCycleList = [
    WorkCycle(workPart: "가슴, 삼두", workImage: "chest"),
    WorkCycle(workPart: "등, 이두", workImage: "backBody"),
    WorkCycle(workPart: "하체, 어깨", workImage: "lowerBody")
]
let fourCycleList  = [
    WorkCycle(workPart: "가슴, 삼두", workImage: "chest"),
    WorkCycle(workPart: "등, 이두", workImage: "backBody"),
    WorkCycle(workPart: "어깨", workImage: "shoulder"),
    WorkCycle(workPart: "하체", workImage: "lowerBody")
]

let fiveCycleList  = [
    WorkCycle(workPart: "가슴", workImage: "chest"),
    WorkCycle(workPart: "등", workImage: "backBody"),
    WorkCycle(workPart: "어께", workImage: "shoulder"),
    WorkCycle(workPart: "하체", workImage: "lowerBody"),
    WorkCycle(workPart: "팔", workImage: "arm")
]


let recommendWorkCycle = ["초보자를 위한 루틴", "중급자를 위한 루틴", "상급자를 위한 루틴", "아침형 인간을 위한 루틴", "다이어트를 위한 루틴"]


let recommendWorkImage = ["recommend1", "recommend2", "recommend3", "recommend4", "recommend5"]



let context = [
    "균형있는 운동: 5분할은 다양한 근육 그룹을 포함하는 균형 잡힌 운동을 할 수 있도록 도와줍니다. 다양한 부위의 근육을 동일하게 발달시키면서도 부상의 위험을 줄일 수 있습니다.",
    "효율성: 4분할 운동은 각 운동 그룹을 더 큰 규모로 결합하여 운동 시간을 최적으로 활용합니다. 예를 들어, 상체와 하체를 나누어 운동하면 더 많은 근육 그룹을 동시에 활용할 수 있습니다.",
    "간편함: 2분할 운동은 운동 일정을 단순화하고 시간을 절약할 수 있습니다. 상체와 하체를 나누어 운동하면 하루에 두 번의 운동만으로도 전신을 다룰 수 있습니다. 집중과 강도: 각 운동 그룹에 대해 더 집중하고 높은 강도의 운동을 할 수 있습니다. 운동 시간이 짧고 집중이 필요한 운동을 수행함으로써 근육 성장과 힘 향상에 도움이 됩니다.",
    "몸을 굵직하게 움직여 줌으로써 근육을 깨우고 관절의 유연성을 향상시킵니다. 허리를 돌리거나 팔과 다리를 흔들어 보세요. 5-10분 정도의 동적 스트레칭으로 충분합니다. 유산소 운동: 아침에 유산소 운동을 추가하여 심폐 지구력을 향상시킬 수 있습니다. 조깅, 브리스크 걷기, 자전거 타기 또는 줄넘기와 같은 활동을 선택하세요. 20-30분 정도의 유산소 운동을 권장합니다.",
    "유산소 운동: 유산소 운동은 지방을 태우고 대사를 촉진시키는 데 효과적입니다. 조깅, 브리스크 걷기, 자전거 타기, 수영 등의 유산소 활동을 선택하세요. 하루에 30분 이상의 유산소 운동을 꾸준히 실시하세요. 강도 있는 유산소 운동: 고강도의 유산소 운동은 더 많은 칼로리를 소모하고 근육을 강화하는 데 도움이 됩니다. 인터벌 트레이닝, 계단 오르기, HIIT (고강도 간격 운동) 등의 강도 있는 유산소 운동을 추가해보세요."
]
