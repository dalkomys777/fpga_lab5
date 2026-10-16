# STM32_1 교체용 완성 코드

- `task3_interrupt_led/ece2_474_routine.c`: 버튼 인터럽트로 1/2/4/8초 간격을 선택하고 TIM6가 PA5 LED를 반전한다.
- `task4_pwm_duty/ece2_474_routine.c`: 버튼 인터럽트로 TIM3 CH1의 비교값을 250/500/750으로 순환한다.

두 파일은 각각 독립 실행본이다. 동시에 합치지 말고 실험할 과제의 파일 하나만 ece2_474 프로젝트의 `Core/Src/ece2_474_routine.c`에 복사한다. 인터럽트 안에는 지연이나 입출력 대기를 사용하지 않는다.
