*** Settings ***
Suite Setup     Setup
Suite Teardown  Teardown
Test Teardown   Test Teardown
Resource        ${RENODEKEYWORDS}

*** Variables ***
# Our shell prompt to expect
${SHELL_PROMPT}    Hello

*** Keywords ***
Start Test
    # Create the Machine
    Execute Command             mach create
    # Load the stm32f4 board definitions
    Execute Command             machine LoadPlatformDescription @../platforms/test_hello.repl
    
    # Load the ELF file
    Execute Command             sysbus LoadELF @../build/uart_simple.elf
    # Connect the UART
    Create Terminal Tester      sysbus.uart0
    Execute Command             showAnalyzer sysbus.uart0
    Start Emulation

*** Test Cases ***
Characters Hello
    [Documentation]             Prints Hello
    [Tags]                      non_critical

    Start Test

    Wait For Line On Uart       Hello        timeout=5
    # Wait For Prompt On Uart     ${SHELL_PROMPT}


String Hello World!
    [Documentation]             Prints Hello World!
    [Tags]                      non_critical

    Start Test
    Wait For Line On Uart       Hello        timeout=5
    Execute Command             machine GetTimeSourceInfo
    Wait For Line On Uart       Hello World!       timeout=5
    Execute Command             machine GetTimeSourceInfo
    # Wait For Prompt On Uart     ${SHELL_PROMPT}

Test prompt
    [Documentation]             Testing shell prompt
    [Tags]                      non_critical

    Start Test

    Wait For Prompt On Uart     ${SHELL_PROMPT}
    Pause Execution
