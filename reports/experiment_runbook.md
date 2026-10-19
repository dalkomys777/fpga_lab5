# LAB5 비Vivado 실험 실행표

## 시작 상태

- 실제 STM32 활성 소스: 과제 3
- 실제 Debug ELF: 과제 3 빌드 성공본
- 원래 활성 파일 백업: `C:/Users/young/Documents/ece2_474/lab5_backup/2026-10-19_before_lab5/`
- Verilog 자체검사: Piano, Traffic, ADC 모두 PASS

## STM32 과제 3

1. NUCLEO-G474RE를 ST-LINK USB로 연결한다.
2. `ece2_474.code-workspace`를 열고 Run and Debug에서 `STM32Cube: Launch ST-Link GDB Server`를 선택해 F5를 누른다.
3. `main`에서 멈추면 F5를 다시 누른다.
4. `button_isr_p7()`에 중단점을 걸고 Watch에 `led_interval_ticks`, `elapsed_ticks`를 추가한다.
5. USER 버튼마다 10→20→40→80→10인지 기록한다.
6. 중단점을 모두 해제한 뒤 PA5 반전 간격 1/2/4/8초를 측정한다.

## STM32 과제 4

1. Shift+F5로 디버깅을 종료한다.
2. LAB5 워크스페이스에서 `Terminal > Run Task... > 08 STM32 Task 4 - Activate and Build`를 실행한다.
3. 성공 문구와 해시를 확인한 뒤 `ece2_474.code-workspace`에서 F5로 다운로드한다.
4. `button_isr_p7()`에 중단점을 걸고 Watch에 `pwm_compare`, `TIM3->CCR1`을 추가한다.
5. USER 버튼마다 250→500→750→250인지 기록한다.
6. 중단점을 해제하고 PB4와 GND를 계측한다.
7. 1 kHz가 유지되는 상태에서 HIGH 시간이 약 0.250/0.500/0.750 ms인지 기록한다.

## 종료 전

1. 사진과 영상은 `evidence/00_stm32/task3` 또는 `task4` 아래에 저장한다.
2. `measurements.csv`와 `evidence_manifest.csv`의 측정값·파일명·판정을 채운다.
3. 원본 파일은 남겨 두고, 편집본을 덮어쓰지 않는다.
4. Vivado 결과는 나중에 각 회로의 `vivado_results` 폴더에 저장한다.
