# LAB5 실험 직전 체크리스트

## 자동 준비 완료

- [x] STM32 과제 3 ARM Debug 컴파일·링크 성공
- [x] STM32 과제 4 ARM Debug 컴파일·링크 성공
- [x] 과제 3·4 검증 ELF와 SHA-256 보관
- [x] 실제 `ece2_474` 활성 파일을 과제 3으로 설정
- [x] 과제 전환·빌드용 VS Code 작업 2개 추가 및 실행 검증
- [x] Piano 자기검사 PASS와 VCD 생성
- [x] Traffic 자기검사 PASS와 VCD 생성
- [x] ADC 자기검사 PASS와 VCD 생성
- [x] 기존 활성 STM32 코드 외부 백업

## 실험실에서 확인

- [ ] NUCLEO-G474RE, ST-LINK USB 데이터 케이블, JP5=`5V_STLK`
- [ ] 오실로스코프/로직 분석기, 프로브와 GND
- [ ] STM32 과제 3 F5 다운로드
- [ ] Watch에서 `led_interval_ticks`: 10→20→40→80→10
- [ ] PA5 반전 간격 1/2/4/8초 측정과 영상 저장
- [ ] 과제 4 전환 작업 실행 후 F5 다운로드
- [ ] Watch에서 `pwm_compare`: 250→500→750→250
- [ ] PB4 1 kHz, duty 25/50/75% 측정과 화면 저장
- [ ] 각 사진·영상 파일명을 측정 CSV에 기록
- [ ] 실험 종료 전 증거 파일을 `evidence` 아래에 복사

Vivado 프로젝트, XDC, 합성·구현·비트스트림 및 FPGA 보드 실험은 별도 진행한다.
