# FPGA LAB5 · STM32_1 인터럽트·PWM / 피아노·신호등·ADC

10월 19일 실험을 위한 예비 실습 저장소다. STM32 과제 3·4의 교체용 `ece2_474_routine.c`와 FPGA 세 회로의 RTL, 자기검사 테스트벤치, 시뮬레이션 설정을 포함한다.

## 실습 구성

| 구분 | 폴더 | 준비된 검증 |
|---|---|---|
| STM32 과제3 | `stm32/task3_interrupt_led/` | PC13 EXTI 디바운스, TIM6 100 ms 계수, PA5 1/2/4/8초 반전 |
| STM32 과제4 | `stm32/task4_pwm_duty/` | PC13 EXTI 디바운스, TIM3 CH1 PB4 1 kHz PWM, 25/50/75% 순환 |
| FPGA 피아노 | `circuits/01_piano/` | 8개 음, 무입력, 다중 키, 리셋 |
| FPGA 신호등 | `circuits/02_traffic/` | 4방향 13단계, 보행자 점멸, 점멸 모드, 리셋 |
| FPGA ADC | `circuits/03_adc/` | 3개 직렬 프레임, 명령·채널·12비트 샘플·리셋 |

## VS Code에서 FPGA 시뮬레이션

1. `LAB5.code-workspace`를 연다.
2. `Terminal > Run Task...`를 누른다.
3. 회로별 `Simulate` 작업을 실행한다. 터미널의 `PASS`와 `build/sim/wave.vcd`를 확인한다.
4. 이어서 같은 회로의 `Open waveform` 작업을 실행하고 Explorer의 `wave.vcd`를 클릭한다.
5. 텍스트로 보이면 탭 우클릭 후 `Reopen Editor With... > VaporView`를 선택한다.

Icarus Verilog와 VaporView가 필요하다. 시뮬레이션은 `simulation.json`에 명시된 파일만 컴파일하며, 변경된 소스와 파형의 해시도 확인한다.

## STM32 사용 순서

과제3과 과제4는 서로 다른 완성본이다. 한 번에 하나만 사용한다.

1. `Terminal > Run Task...`에서 `07 STM32 Task 3 - Activate and Build` 또는 `08 STM32 Task 4 - Activate and Build`를 선택한다.
2. 작업이 선택한 파일을 실제 `ece2_474` 프로젝트에 복사하고 ARM Debug ELF를 빌드한다.
3. `ece2_474.code-workspace`의 Run and Debug에서 F5를 눌러 보드에 다운로드한다.
4. 실제 보드 실험은 과제3과 과제4를 각각 따로 확인한다.

2026-10-19 기준 두 과제 모두 실제 ARM Debug 빌드를 통과했고 검증 ELF는 `stm32/prebuilt/`에 보관했다. 실험 시작을 위해 실제 `ece2_474` 프로젝트에는 과제3이 활성화되어 있다.

두 파일은 ece2_474 v1.1.0의 현재 `ece2_474.h`, `main.h`, TIM3/TIM6 설정을 기준으로 작성했고 실제 ARM Debug 빌드를 통과했다. 교체 전 활성 파일은 `ece2_474/lab5_backup/2026-10-19_before_lab5/`에 보관했다.

## Vivado 프로젝트 생성 기준

세 회로의 HBE-Combo II-DLD Spartan-7 S75(`xc7s75fgga484-1`)용 XDC를 각 `constraints/` 폴더에 준비했다. 기준 클록은 50 MHz(20 ns)다.

| 회로 | Vivado 최상위 모듈 | 제약 파일 |
|---|---|---|
| 피아노 | `piano` | `circuits/01_piano/constraints/lab5_piano.xdc` |
| 신호등 | `traffic` | `circuits/02_traffic/constraints/lab5_traffic.xdc` |
| ADC | `adc_hw` | `circuits/03_adc/constraints/lab5_adc.xdc` |

Vivado에서 RTL 파일을 Design Sources로 추가하고 해당 회로의 XDC를 Constraints로 추가한 뒤 표의 최상위 모듈을 설정한다. ADC는 `adc.v`가 아니라 `adc_hw.v`를 최상위로 지정해야 디버그 신호가 외부 핀으로 노출되지 않는다. 테스트벤치에서는 시뮬레이션 시간을 줄이기 위해 분주 매개변수를 작게 덮어쓴다.

## 출처

- `ece2_474/docs/STM32_1.md`
- `ece2_474/docs/FPGA_additional.md`
- `ece2_474/docs/STM32_4week_plan.pdf`
