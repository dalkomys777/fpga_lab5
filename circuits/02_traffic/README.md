# 신호등 제어

네 방향을 각 13단계로 순환하고 보행자 점멸과 전체 점멸 모드를 만든다.

- Vivado 최상위 모듈: `traffic`
- 시뮬레이션 최상위: `tb`
- 예상 자기검사 결과: `PASS traffic: full cycle, pedestrian blink, flicker, reset`
- 파형: `build/sim/wave.vcd`

XDC와 Vivado 프로젝트는 교재의 실제 보드 핀표를 확인한 뒤 추가한다. 테스트벤치는 시뮬레이션 시간을 줄이기 위해 분주 매개변수를 작게 덮어쓴다.
