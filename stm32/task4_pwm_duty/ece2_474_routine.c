/* STM32_1 과제4: PC13 EXTI로 PB4 TIM3 CH1 PWM 듀티비 순환 */
#include "ece2_474.h"
#include "main.h"

#define BUTTON_DEBOUNCE_MS 200U
#define PWM_COMPARE_25     250U
#define PWM_COMPARE_50     500U
#define PWM_COMPARE_75     750U

/* 디버거의 Variables/Watch에서 pwm_compare를 확인한다. */
static volatile uint32_t pwm_compare = PWM_COMPARE_25;

static void button_isr_p7(void);
static void tim6_isr_p4(void);
static void uart2_isr_p6(void);
static void uart3_isr_p5(void);
static void gpio_in_pullup_isr_p8_ece2(void);
static void gpio_in_pulldown_isr_p9_ece2(void);

void ece2_474_init(void)
{
    pwm_compare = PWM_COMPARE_25;
    __HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_1, pwm_compare);
    (void)HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1);
}

void polling_routine(void)
{
    /* 과제4에서는 버튼 인터럽트가 PWM 비교값을 직접 변경한다. */
}

static void button_isr_p7(void)
{
    static uint32_t last_press_ms = 0U;
    uint32_t now_ms = HAL_GetTick();

    if ((now_ms - last_press_ms) < BUTTON_DEBOUNCE_MS)
    {
        return;
    }
    last_press_ms = now_ms;

    if (pwm_compare == PWM_COMPARE_25)
    {
        pwm_compare = PWM_COMPARE_50;
    }
    else if (pwm_compare == PWM_COMPARE_50)
    {
        pwm_compare = PWM_COMPARE_75;
    }
    else
    {
        pwm_compare = PWM_COMPARE_25;
    }

    __HAL_TIM_SET_COMPARE(&htim3, TIM_CHANNEL_1, pwm_compare);
}

static void tim6_isr_p4(void)
{
    /* 과제4에서는 TIM6를 사용하지 않는다. */
}

static void uart2_isr_p6(void) {}
static void uart3_isr_p5(void) {}
static void gpio_in_pullup_isr_p8_ece2(void) {}
static void gpio_in_pulldown_isr_p9_ece2(void) {}

void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
{
    if (GPIO_Pin == BUTTON_ece2_Pin)
    {
        button_isr_p7();
    }
    else if (GPIO_Pin == GPIO_IN_PULLUP_ece2_Pin)
    {
        gpio_in_pullup_isr_p8_ece2();
    }
    else if (GPIO_Pin == GPIO_IN_PULLDOWN_ece2_Pin)
    {
        gpio_in_pulldown_isr_p9_ece2();
    }
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim)
{
    if (htim->Instance == TIM6)
    {
        tim6_isr_p4();
    }
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
{
    if (huart->Instance == USART2)
    {
        uart2_isr_p6();
    }
    else if (huart->Instance == USART3)
    {
        uart3_isr_p5();
    }
}
