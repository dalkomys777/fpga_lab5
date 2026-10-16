/* STM32_1 과제3: PC13 EXTI + TIM6 100 ms로 PA5 LED 간격 제어 */
#include "ece2_474.h"
#include "main.h"

#define BUTTON_DEBOUNCE_MS 200U
#define TICKS_1_SECOND     10U
#define TICKS_8_SECONDS    80U

/* Cortex-M4에서 정렬된 32비트 읽기/쓰기는 원자적이다.
 * 두 ISR이 공유하므로 컴파일러가 실제 메모리를 읽도록 volatile을 사용한다.
 */
static volatile uint32_t led_interval_ticks = TICKS_1_SECOND;
static volatile uint32_t elapsed_ticks = 0U;

static void button_isr_p7(void);
static void tim6_isr_p4(void);
static void uart2_isr_p6(void);
static void uart3_isr_p5(void);
static void gpio_in_pullup_isr_p8_ece2(void);
static void gpio_in_pulldown_isr_p9_ece2(void);

void ece2_474_init(void)
{
    led_interval_ticks = TICKS_1_SECOND;
    elapsed_ticks = 0U;
    HAL_GPIO_WritePin(LED_ece2_GPIO_Port, LED_ece2_Pin, GPIO_PIN_RESET);
    (void)HAL_TIM_Base_Start_IT(&htim6);
}

void polling_routine(void)
{
    /* 과제3에서는 버튼과 LED 시간을 모두 ISR에서 처리한다. */
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
    if (led_interval_ticks >= TICKS_8_SECONDS)
    {
        led_interval_ticks = TICKS_1_SECOND;
    }
    else
    {
        led_interval_ticks *= 2U;
    }
    elapsed_ticks = 0U;
}

static void tim6_isr_p4(void)
{
    uint32_t interval = led_interval_ticks;
    uint32_t next_ticks = elapsed_ticks + 1U;

    if (next_ticks >= interval)
    {
        elapsed_ticks = 0U;
        HAL_GPIO_TogglePin(LED_ece2_GPIO_Port, LED_ece2_Pin);
    }
    else
    {
        elapsed_ticks = next_ticks;
    }
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
