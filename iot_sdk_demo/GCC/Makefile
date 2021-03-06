##############################################################################
#
# Project settings
#
##############################################################################


SOURCE_DIR  = ../../../../..
BINPATH     = ~/gcc-arm-none-eabi/bin
PWD         = $(shell pwd)
DATIME      = $(shell date --iso=seconds)
V          ?= 0

##############################################################################
#
# build log output
#
##############################################################################


ifeq ($(V),0)
Q           = @
else
Q           =
endif


##############################################################################
#
# config files
#
##############################################################################


FEATURE    ?= feature.mk

include $(FEATURE)

# Gloabl Config
-include $(SOURCE_DIR)/.config
# IC Config
-include $(SOURCE_DIR)/config/chip/$(IC_CONFIG)/chip.mk
# Board Config
-include $(SOURCE_DIR)/config/board/$(BOARD_CONFIG)/board.mk


##############################################################################
#
# Project specific features
#
##############################################################################


ifeq ($(MTK_CLI_EXAMPLE_MODE_ENABLE),y)
CFLAGS         += -DMTK_CLI_EXAMPLE_MODE_ENABLE
endif


##############################################################################
#
# config
#
##############################################################################


RAM_BOOTING     = 0

DEBUG           = 0
FLOAT_TYPE      = hard
BUILD_DIR       = $(PWD)/Build

# Project name
PROJ_NAME       = $(IC_CONFIG)_iot_sdk_demo
PROJ_PATH       = $(PWD)
OUTPATH         = $(PWD)/Build

# Main APP files
APP_PATH        = project/$(IC_CONFIG)_hdk/apps/iot_sdk_demo
APP_PATH_SRC    = $(APP_PATH)/src


##############################################################################
#
# SDK source files
#
##############################################################################


APP_FILES       = $(APP_PATH_SRC)/main.c     \
                  $(APP_PATH_SRC)/lwip_network.c \
                  $(APP_PATH_SRC)/app_common.c \
                  driver/board/mt76x7_hdk/init/src/io_def.c \
                  $(APP_PATH)/GCC/syscalls.c \
                  $(APP_PATH_SRC)/sys_init.c \
                  $(APP_PATH_SRC)/network_init.c \
                  $(APP_PATH_SRC)/jerry_run.c \

APP_FILES       += $(APP_PATH_SRC)/ept_gpio_var.c
APP_FILES       += $(APP_PATH_SRC)/ept_eint_var.c

SYS_FILES       = $(APP_PATH_SRC)/system_mt7687.c

ifeq ($(MTK_MINICLI_ENABLE),y)
APP_FILES       += $(APP_PATH_SRC)/cli_def.c
APP_FILES       += $(APP_PATH_SRC)/cli_cmds.c
endif

ifeq ($(MTK_JR_ENABLE),y)
APP_FILES += $(APP_PATH_SRC)/jerry-port.c
endif

# =============================================
# for javascript
# =============================================

APP_FILES += $(APP_PATH_SRC)/ml/src/ml-adc.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-fota.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-gpio.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-http.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-md5.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-mqtt.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-pinmux.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-pwm.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-sha.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-timer.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-wdt.c
APP_FILES += $(APP_PATH_SRC)/ml/src/ml-wifi.c


C_FILES         += $(APP_FILES) $(SYS_FILES)
C_FILES += driver/board/mt76x7_hdk/ept/src/bsp_gpio_ept_config.c


S_FILES         += $(APP_PATH)/GCC/startup_mt7687.s


##############################################################################
#
# SDK object files
#
##############################################################################


C_OBJS          = $(C_FILES:%.c=$(BUILD_DIR)/%.o)
S_OBJS          = $(S_FILES:%.s=$(BUILD_DIR)/%.o)
CXX_OBJS        = $(CXX_FILES:%.cpp=$(BUILD_DIR)/%.o)


##############################################################################
#
# CFLAGS
#
##############################################################################


CFLAGS += -DMTK_FW_VERSION=\"$(MTK_FW_VERSION)\"


###################################################
# include path
CFLAGS += -I$(SOURCE_DIR)/$(APP_PATH)/inc
CFLAGS += -I$(SOURCE_DIR)/driver/chip/$(IC_CONFIG)/inc
CFLAGS += -I$(SOURCE_DIR)/driver/chip/inc
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/lwip/src/include
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/lwip/ports/include
ifeq ($(ml-mqtt),y)
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/mqtt/MQTTClient-C/src/mediatek
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/mqtt/MQTTClient-C/src
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/mqtt/MQTTPacket/src
endif
ifeq ($(ml-mcs),y)
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/mqtt/MQTTClient-C/src/mediatek
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/mqtt/MQTTClient-C/src
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/mqtt/MQTTPacket/src
endif
CFLAGS += -I$(SOURCE_DIR)/middleware/MTK/fota/inc/
CFLAGS += -I$(SOURCE_DIR)/middleware/MTK/minisupp/src_protected/wpa_supplicant_8.jb4_1/wpa_supplicant
CFLAGS += -I$(SOURCE_DIR)/driver/board/mt76x7_hdk/wifi/inc
# CFLAGS += -I$(SOURCE_DIR)/driver/board/mt76x7_hdk/init/inc

ifeq ($(MTK_LED_ENABLE),y)
CFLAGS += -I$(SOURCE_DIR)/driver/board/component/led
CFLAGS += -I$(SOURCE_DIR)/driver/board/mt76x7_hdk/led/inc
endif

CFLAGS += -I$(SOURCE_DIR)/driver/board/mt76x7_hdk/ept/inc

###################################################
# jerryscript
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc
# CFLAGS +=-mfloat-abi=softfp
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/vm
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/parser
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/parser/regexp
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/parser/js
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/parser/js/bc
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/parser/js/collections
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/ecma
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/ecma/operations
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/ecma/base
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/ecma/builtin-objects
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/rcs
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/jrt
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/mem
CFLAGS += -I$(SOURCE_DIR)/middleware/jerryscript/inc/lit

##############################################################################
#
# LDFLAGS
#
##############################################################################


LDFLAGS += $(ALLFLAGS) $(FPUFLAGS) --specs=nano.specs -lnosys -nostartfiles
LDFLAGS += -u _printf_float -u _scanf_float

ifeq ($(RAM_BOOTING), 1)
LDFLAGS += -Wl,-Tmt7687_sram.ld -Wl,--gc-sections
else
LDFLAGS += -Wl,-Tmt7687_flash.ld -Wl,--gc-sections
endif

ifneq ($(MTK_DEBUG_LEVEL), none)
LDFLAGS += -Wl,-wrap=printf
endif

ifeq ($(MTK_JR_ENABLE),y)
# Jerryscript (Javascript Engine)
# LIBS += $(SOURCE_DIR)/middleware/jerryscript/lib/librelease-cp.jerry-core.a
LIBS += $(SOURCE_DIR)/middleware/jerryscript/targets/RTOS/libjerry/libjerrycore.a
LIBS += $(SOURCE_DIR)/middleware/jerryscript/targets/RTOS/libjerry/libjerrylibm.a
endif

##############################################################################
#
# Libraries
#
##############################################################################
LIBS += $(OUTPATH)/libhttpclient.a
ifeq ($(ml-http2),y)
LIBS += $(OUTPATH)/libnghttp2.a
endif
ifeq ($(ml-mqtt),y)
LIBS += $(OUTPATH)/libmqtt.a
endif
ifeq ($(ml-mcs),y)
LIBS += $(OUTPATH)/libmqtt.a
endif
LIBS += $(OUTPATH)/libmbedtls.a
LIBS += $(OUTPATH)/libbspex.a
LIBS += $(OUTPATH)/libminicli.a
ifeq ($(MTK_WIFI_WPS_ENABLE),y)
LIBS += $(OUTPATH)/libminisupp_wps.a
else
LIBS += $(OUTPATH)/libminisupp.a
endif
LIBS += $(OUTPATH)/libbsp.a
LIBS += $(OUTPATH)/libnvdm_CM4_GCC.a
LIBS += $(OUTPATH)/libiperf.a
LIBS += $(OUTPATH)/librtos.a
LIBS += $(OUTPATH)/libsmtcn.a
LIBS += $(OUTPATH)/libservice.a
LIBS += $(OUTPATH)/libping.a
LIBS += $(OUTPATH)/liblwip.a
LIBS += $(OUTPATH)/libhal.a
LIBS += $(OUTPATH)/libdhcpd.a
LIBS += $(OUTPATH)/libfota.a

MODULE_PATH += $(KRL_OS_PATH)
MODULE_PATH += $(MID_LWIP_PATH)
MODULE_PATH += $(MID_DHCPD_PATH)
MODULE_PATH += $(MID_MINICLI_PATH)
MODULE_PATH += $(MID_MINISUPP_PATH)
MODULE_PATH += $(MID_HTTPCLIENT_PATH)
MODULE_PATH += $(MID_NVDM_PATH)
MODULE_PATH += $(MID_SMTCN_PATH)
MODULE_PATH += $(MID_BSPEXT_PATH)
MODULE_PATH += $(MID_MBEDTLS_PATH)
MODULE_PATH += $(DRV_CHIP_PATH)
MODULE_PATH += $(KRL_SRV_PATH)
MODULE_PATH += $(DRV_BSP_PATH)
MODULE_PATH += $(MID_PING_PATH)
MODULE_PATH += $(MID_IPERF_PATH)
MODULE_PATH += $(MID_FOTA_PATH)
MODULE_PATH += $(MID_NGHTTP2_PATH)

ifeq ($(ml-mqtt),y)
MODULE_PATH += $(MID_MQTT_PATH)
endif
ifeq ($(ml-mcs),y)
MODULE_PATH += $(MID_MQTT_PATH)
endif

##############################################################################
#
# Target Rules
#
##############################################################################


.PHONY: proj clean $(MODULE_PATH)

all: proj
	$(Q)mkdir -p $(BUILD_DIR)
	$(Q)$(SIZE) $(OUTPATH)/$(PROJ_NAME).elf
	$(Q)echo "Generate Assembly from elf:"
	# $(Q)$(OBJDUMP) -S $(OUTPATH)/$(PROJ_NAME).elf > $(OUTPATH)/$(PROJ_NAME).elf.s
	$(Q)$(SOURCE_DIR)/tools/scripts/build/copy_firmware.sh $(SOURCE_DIR) $(OUTPATH) $(IC_CONFIG) $(BOARD_CONFIG) $(PROJ_NAME).bin $(PWD)
	$(Q)cp *.cmm $(OUTPATH)/

MOD_EXTRA = BUILD_DIR=$(BUILD_DIR) OUTPATH=$(OUTPATH) PROJ_PATH=$(PROJ_PATH)

$(LIBS): $(MODULE_PATH)

$(MODULE_PATH):
	$(Q)+make -C $@ $(MOD_EXTRA) $($@_EXTRA)


proj: $(OUTPATH)/$(PROJ_NAME).elf

$(OUTPATH)/$(PROJ_NAME).elf: $(C_OBJS) $(CXX_OBJS) $(S_OBJS) $(LIBS)
	$(Q)echo Linking...
	$(Q)if [ -e "$@" ]; then rm -f "$@"; fi
	$(Q)if [ -e "$(OUTPATH)/$(PROJ_NAME).map" ]; then rm -f "$(OUTPATH)/$(PROJ_NAME).map"; fi
	$(Q)if [ -e "$(OUTPATH)/$(PROJ_NAME).hex" ]; then rm -f "$(OUTPATH)/$(PROJ_NAME).hex"; fi
	$(Q)if [ -e "$(OUTPATH)/$(PROJ_NAME).bin" ]; then rm -f "$(OUTPATH)/$(PROJ_NAME).bin"; fi
	$(Q)$(CXX) $(LDFLAGS) -Wl,--start-group $^ -Wl,--end-group -Wl,-Map=$(OUTPATH)/$(PROJ_NAME).map -lm -o $@ 2>>$(ERR_LOG)
	$(Q)$(OBJCOPY) -O ihex $(OUTPATH)/$(PROJ_NAME).elf $(OUTPATH)/$(PROJ_NAME).hex
	$(Q)$(OBJCOPY) -O binary $(OUTPATH)/$(PROJ_NAME).elf $(OUTPATH)/$(PROJ_NAME).bin
	$(Q)echo Done


include $(SOURCE_DIR)/.rule.mk

clean:
	$(Q)rm -rf $(OUTPATH)
	$(Q)if [ -e $(MID_MINISUPP_PATH) ]; then \
		make -C $(MID_MINISUPP_PATH) $(MOD_EXTRA) clean \
	;fi

.PHONY: options

options:
	@for opt in `sed 's/[()]/\n/g' $(SOURCE_DIR)/config/chip/$(IC_CONFIG)/chip.mk|sed 's/-D/ /'|sort|uniq|grep ^MTK_|grep _ENABLE$$`; do echo $$opt; done
print-%  : ; @echo $* = $($*)
