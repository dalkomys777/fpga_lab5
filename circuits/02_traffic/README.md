# 신호등 제어

네 방향을 각 13단계로 순환하고 보행자 점멸과 전체 점멸 모드를 만든다.

- Vivado 최상위 모듈: `traffic`
- 시뮬레이션 최상위: `tb`
- 예상 자기검사 결과: `PASS traffic: full cycle, pedestrian blink, flicker, reset`
- 파형: `build/sim/wave.vcd`

Vivado에서는 `lab5_traffic.xpr`을 바로 열면 된다. `traffic`이 Design Top이고 `tb`가 Simulation Top이며 `constraints/lab5_traffic.xdc`도 등록되어 있다. 핀 배열은 교재 표와 동일하게 `[3]=남, [2]=북, [1]=서, [0]=동`이다. `flicker` 입력은 SW_2(N8)에 연결했으며, 테스트벤치는 시뮬레이션 시간을 줄이기 위해 분주 매개변수를 작게 덮어쓴다.
