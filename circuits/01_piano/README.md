# 피아노

8개 단일 키를 음계 주파수로 바꾸고 50 MHz 기준 사각파를 생성한다.

- Vivado 최상위 모듈: `piano`
- 시뮬레이션 최상위: `tb`
- 예상 자기검사 결과: `PASS piano: all 8 tones, silence, multiple keys, reset`
- 파형: `build/sim/wave.vcd`

XDC와 Vivado 프로젝트는 교재의 실제 보드 핀표를 확인한 뒤 추가한다. 테스트벤치는 시뮬레이션 시간을 줄이기 위해 분주 매개변수를 작게 덮어쓴다.
