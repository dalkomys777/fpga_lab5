# 검증된 STM32 Debug 펌웨어

2026-10-19에 `C:/Users/young/Documents/ece2_474`의 실제 CMake Debug 프로젝트로 다시 컴파일하고 링크한 보관본이다.

| 과제 | 파일 | RAM | FLASH | SHA-256 |
|---|---|---:|---:|---|
| 과제 3 | `task3/ece2_474_task3_debug.elf` | 2,656 B | 26,036 B | `87E656C472EA5DC02000DC2DDCC98673BCE9A0E307C60159EE59DE6B4F64E123` |
| 과제 4 | `task4/ece2_474_task4_debug.elf` | 2,648 B | 26,320 B | `38B9DFCFFB9780846B44FA313485B35858EC8382E8190F824F5C1ECE83C93457` |

일반 실험에서는 `LAB5.code-workspace`의 `07/08 STM32 ... Activate and Build` 작업을 사용한다. 이 ELF들은 빌드 환경 문제에 대비한 보관본이며, 보드 다운로드 자체는 `ece2_474.code-workspace`에서 F5로 실행한다.
