LOCAL_PATH := $(call my-dir)

#Headers to export
include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := qcom/display
LOCAL_COPY_HEADERS := qcom_ui.h
include $(BUILD_COPY_HEADERS)

include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO := qcom/display/utils
LOCAL_COPY_HEADERS := utils/IdleInvalidator.h
LOCAL_COPY_HEADERS += utils/profiler.h
include $(BUILD_COPY_HEADERS)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
        qcom_ui.cpp \
        utils/profiler.cpp \
        utils/IdleInvalidator.cpp

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

ifneq ($(call is-vendor-board-platform,QCOM),true)
    LOCAL_CFLAGS += -DNON_QCOM_TARGET
else
    LOCAL_SHARED_LIBRARIES += libmemalloc
endif

LOCAL_CFLAGS += -DDEBUG_CALC_FPS

LOCAL_MODULE := libQcomUI
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
