Cookie Consent Repetition Experiment Prototype

실행:
1) index.html을 브라우저에서 직접 열어도 동작합니다.
2) 더 안정적으로는 이 폴더에서 `python -m http.server 8000` 실행 후 브라우저에서 localhost:8000 접속.

구현된 설계:
- Between-subjects: Easy Reject / Hard Reject (시작 시 무작위 배정 가능)
- 10개의 독립 가상 웹사이트 / 각 사이트 배너 1회
- Easy: Reject All / Accept All (각 1 click)
- Hard: Manage Cookies -> Save selected (Reject 2 clicks), Accept All 1 click
- 자동 기록: condition, trial, site, choice, reject binary, decision time, manage entry, click count
- 사전 설문: 평소 cookie 행동, banner 경험 빈도, privacy concern 단일 항목
- 사후 설문: exploratory subjective fatigue 5문항, perceived rejection effort manipulation check 1문항
- 종료 후 participant-level CSV와 전체 JSON 다운로드

중요:
- 현재 버전은 연구 프로토타입입니다. 실제 연구 전 IRB/연구윤리 및 동의 절차, 검증된 척도 선정, 표본수/power analysis가 필요합니다.
- 현재 데이터는 서버로 자동 수집되지 않습니다. 참가자가 종료 화면에서 파일을 내려받는 방식입니다. 실제 배포 연구에서는 서버 저장 또는 설문 플랫폼 연동을 구현해야 합니다.
- 사이트 내용/순서 효과를 통제하려면 사이트 순서 randomization/counterbalancing을 후속 버전에서 고려하세요.
- easy or hard 쿠키 배너 설정 수정 필요(사용자 선택은 아닌 것 같음)
-참가자 ID로 표기하는 것 보단 몇 년생 or 나이 이런 식으로 입력하여 구분되게만 아니면 그런거 없이 자동으로 순서 매길 수 있도록 수정 필요
- 사전 설문 내용을 좀 더 많이
사후 설문도 좀 다듬ㅇ기

1. 검증된 척도 선정, 표본수/power analysis는 어떤건지 상세하게 설명하고 어떻게하면 할 수 있는지 설명
2. 데이터 자동 수집 방법에 대해 구현할 수 있는 방법 제안
3. 참가자 ID로 표기하는 것 보단 몇 년생 or 나이 이런 식으로 입력하여 구분되게만 아니면 그런거 없이 자동으로 순서 매길 수 있도록 수정 필요
4.사이트 내용/순서 효과를 통제하려면 사이트 순서 randomization/counterbalancing을 후속 버전에서 고려
5. easy or hard 쿠키 배너 설정 수정 필요(사용자 선택은 아닌 것 같음)

쿠키 설정에 들어가서 /필수/분석/광고/ 이부분도 선택 할 수 있게 해서 통계낼 수 있게(논문에 포함 x)
6. 사후 설문도 이용자에게 편하게 볼 수 있게 