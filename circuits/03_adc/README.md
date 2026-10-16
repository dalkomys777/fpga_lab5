# ADC 직렬 제어

외부 ADC에 16비트 채널 명령을 보내고 12비트 변환값을 받아 LED에 표시한다.

- Vivado 최상위 모듈: `adc`
- 시뮬레이션 최상위: `tb`
- 예상 자기검사 결과: `PASS ADC: 3 serial frames, command bits, sample, reset`
- 파형: `build/sim/wave.vcd`

XDC와 Vivado 프로젝트는 교재의 실제 보드 핀표를 확인한 뒤 추가한다. 테스트벤치는 시뮬레이션 시간을 줄이기 위해 분주 매개변수를 작게 덮어쓴다.
