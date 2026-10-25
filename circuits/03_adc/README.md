# ADC 직렬 제어

외부 ADC에 16비트 채널 명령을 보내고 12비트 변환값을 받아 LED에 표시한다.

- Vivado 최상위 모듈: `adc_hw`
- 시뮬레이션 최상위: `tb`
- 예상 자기검사 결과: `PASS ADC: 3 serial frames, command bits, sample, reset`
- 파형: `build/sim/wave.vcd`

Vivado에서는 `lab5_adc.xpr`을 바로 열면 된다. `adc_hw`가 Design Top이고 `tb`가 Simulation Top이며 `constraints/lab5_adc.xdc`도 등록되어 있다. DIP1~DIP3이 ADC 채널을 선택하고 변환값 상위 8비트를 LED_D1~LED_D8에 표시한다. `adc` 모듈의 `sample`과 `data_valid`는 하드웨어 래퍼 내부에 남겨 외부 핀 제약 대상에서 제외했다.
