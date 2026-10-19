# STM32_1 교체용 완성 코드

- `task3_interrupt_led/ece2_474_routine.c`: 버튼 인터럽트로 1/2/4/8초 간격을 선택하고 TIM6가 PA5 LED를 반전한다.
- `task4_pwm_duty/ece2_474_routine.c`: 버튼 인터럽트로 TIM3 CH1의 비교값을 250/500/750으로 순환한다.

두 파일은 각각 독립 실행본이다. 동시에 합치지 말고 실험할 과제의 파일 하나만 ece2_474 프로젝트의 `Core/Src/ece2_474_routine.c`에 복사한다. 인터럽트 안에는 지연이나 입출력 대기를 사용하지 않는다.

## 한 번에 전환하고 빌드하기

`LAB5.code-workspace`를 연 뒤 `Terminal > Run Task...`에서 다음 작업 중 하나를 실행한다.

- `07 STM32 Task 3 - Activate and Build`
- `08 STM32 Task 4 - Activate and Build`

작업은 선택한 완성 코드를 실제 `ece2_474` 프로젝트에 복사하고 ARM Debug ELF를 빌드한다. 성공하면 소스와 ELF의 SHA-256이 터미널에 출력된다. 빌드 뒤에는 `ece2_474.code-workspace`의 Run and Debug에서 F5를 눌러야 보드에 다운로드된다.

실험 시작 상태는 과제 3이다. 과제 3 검증을 마치고 디버깅을 종료한 뒤 위 작업으로 과제 4를 활성화한다.
