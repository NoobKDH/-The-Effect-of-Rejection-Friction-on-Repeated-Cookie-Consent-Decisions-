COOKIE CONSENT EXPERIMENT v2

구현된 핵심
- 자동 UUID + 연구용 코드(P-XXXXXXXX) 생성
- Easy/Hard 자동 무작위 배정 (참가자 선택 없음)
- 참가자별 10개 사이트 순서 무작위화
- 10개 사이트별 주제/브랜딩/간단 콘텐츠 레이아웃
- Easy: 모두 거부 / 쿠키 설정 / 모두 수락
- Hard: 쿠키 설정 / 모두 수락
- Easy/Hard의 쿠키 설정 화면은 동일
- 설정 화면: 분석/광고 토글 + 모두 거부 + 현재 상태 저장
- 모두 거부: 즉시 다음 사이트
- 현재 상태 저장: 현재 토글 상태를 저장한 뒤 즉시 다음 사이트
- final_choice와 choice_path를 분리 저장
- 사전 설문 + IUIPC-8 번역안
- 사후 설문 10문항 + 자유응답
- 각 trial 즉시 자동 저장
- Supabase 미설정/오류 시 localStorage fallback

중요: 현재 연결된 ChatGPT Supabase 플러그인에서는 접근 가능한 project가 0개로 반환되어 실제 DB에는 아직 연결하지 못했습니다.
따라서 config.js의 supabaseUrl / supabasePublishableKey가 비어 있습니다.

SUPABASE 연결 방법
1) Supabase project가 플러그인에 보이도록 연결/권한 확인
2) schema.sql을 프로젝트에 적용
3) config.js에 Project URL과 Publishable Key(sb_publishable_...) 입력
4) HTTP server로 실행
   python -m http.server 8000
   브라우저: http://localhost:8000

보안
- 브라우저에는 Publishable Key만 사용하세요. Secret/service_role key는 절대 넣지 마세요.
- schema.sql은 수업용 prototype을 위한 최소 insert/update RLS입니다.
- 실제 공개 배포에서는 익명 update를 더 제한하거나 Auth/Edge Function을 사용하는 것이 안전합니다.

실험 설계 주의
- 현재 condition은 클라이언트 50:50 random assignment입니다. 전역적으로 정확한 block randomization은 DB RPC/Edge Function을 추가하는 것이 적절합니다.
- 연구용 ID는 UUID에서 파생한 P-XXXXXXXX입니다. 실제 전역 순번 P0001 방식은 서버 sequence/RPC가 필요합니다.
- IUIPC-8 한국어 문항은 연구용 번역안입니다. 본 실험 전 번역/역번역 또는 검증된 한국어판 확인이 필요합니다.
- 사후 fatigue 5문항은 exploratory subjective consent-fatigue items이며 검증된 cookie-fatigue scale이라고 부르면 안 됩니다.
