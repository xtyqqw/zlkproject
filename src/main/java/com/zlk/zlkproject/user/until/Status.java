package com.zlk.zlkproject.user.until;

import java.util.concurrent.TimeUnit;

/**
 * @ClassName： Status
 * @Description： redis状态枚举类
 * @Author： yzh
 * @Date： 2019/12/23 16:32
 */

public abstract  class Status {

    /**
     * 过期时间相关枚举
     */
    public static enum ExpireEnum{
        //未读消息的有效期为30天
        UNREAD_MSG(30L, TimeUnit.DAYS)
        ;

        /**
         * 过期时间
         */
        private Long time;
        /**
         * 时间单位
         */
        private TimeUnit timeUnit;

        ExpireEnum(Long time, TimeUnit timeUnit) {
            this.time = time;
            this.timeUnit = timeUnit;
        }

        public Long getTime() {
            return time;
        }

        public TimeUnit getTimeUnit() {
            return timeUnit;
        }
    }
}

