LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        qcom_ui.cpp \
        utils/profiler.cpp \
        utils/IdleTimer.cpp

LOCAL_SHARED_LIBRARIES := \
        libutils \
        libcutils \
        libui \
        libEGL \
        libskia

LOCAL_C_INCLUDES := $(TOP)/hardware/qcom/display/libgralloc \
                    $(TOP)/frameworks/base/services/surfaceflinger \
                    $(TOP)/external/skia/include/core \
                    $(TOP)/external/skia/include/images

LOCAL_CFLAGS := -DLOG_TAG=\"libQcomUI\"

ifneq ($(BOARD_USES_QCOM_HARDWARE),true)
    LOCAL_CFLAGS += -DNON_QCOM_TARGET
else
    LOCAL_SHARED_LIBRARIES += libmemalloc
endif

LOCAL_CFLAGS += -DDEBUG_CALC_FPS -DQCOM_HARDWARE

LOCAL_MODULE := libQcomUI
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
