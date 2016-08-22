IC_CONFIG = mt7687
BOARD_CONFIG = mt7687_hdk
TOTAL_HEAP_SIZE = y
MTK_FW_VERSION = mt7687_fw
MTK_HAL_LOWPOWER_ENABLE = y
MTK_BSPEXT_ENABLE = y
MTK_IPERF_ENABLE = y
MTK_PING_OUT_ENABLE = y
MTK_WIFI_TGN_VERIFY_ENABLE = y
MTK_MINICLI_ENABLE = y
MTK_MAIN_CONSOLE_UART2_ENABLE = n
MTK_SMTCN_ENABLE = y
MTK_WIFI_WPS_ENABLE = n
MTK_WIFI_DIRECT_ENABLE = n
MTK_WIFI_REPEATER_ENABLE = y
MTK_DEBUG_LEVEL = info
MTK_TFTP_ENABLE = n
MTK_FOTA_ENABLE = y
MTK_FOTA_CLI_ENABLE = y
MTK_MQTT = n
MTK_LOAD_MAC_ADDR_FROM_EFUSE = n
MTK_HOMEKIT_ENABLE = n
MTK_JR_ENABLE = y
MTK_CLI_EXAMPLE_MODE_ENABLE = y
MTK_SUPPORT_HEAP_DEBUG = n
MTK_HEAP_SIZE_GUARD_ENABLE = n
MTK_OS_CPU_UTILIZATION_ENABLE = n
MTK_WIFI_PROFILE_ENABLE = n
MTK_MBEDTLS_CONFIG_FILE = config-mtk-basic.h
MTK_HTTPCLIENT_SSL_ENABLE = y
MTK_LWIP_ENABLE = y
HALEX = n
ml-pinmux = y
ml-gpio = y
ml-wifi = y
ml-http = y
ml-timer = y
ml-pwm = y
ml-wdt = y
ml-md5 = y
ml-sha = y
ml-adc = y
ml-mqtt = y


ifeq ($(MTK_JR_ENABLE),y)
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc
CFLAGS += -DMTK_JR_ENABLE
endif

ifeq ($(ml-mcs),y)
CFLAGS += -Dml-mcs
endif
