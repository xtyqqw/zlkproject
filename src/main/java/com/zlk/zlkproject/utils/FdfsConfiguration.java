package com.zlk.zlkproject.utils;

import com.github.tobato.fastdfs.FdfsClientConfig;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableMBeanExport;
import org.springframework.context.annotation.Import;
import org.springframework.jmx.support.RegistrationPolicy;

/**
 * @ClassName: FdfsConfiguration
 * @Description:  注入fdfs
 * @Author: Xiao Nong
 * @Version: 1.0
 */
@Configuration
@Import(FdfsClientConfig.class)
@EnableMBeanExport(registration= RegistrationPolicy.IGNORE_EXISTING)
public class FdfsConfiguration {
}
