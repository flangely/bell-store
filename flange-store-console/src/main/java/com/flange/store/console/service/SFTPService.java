package com.flange.store.console.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author flangely
 * @create 2019-03-23
 * <p>图片上传服服务Service
 * 11:45 AM
 */
public interface SFTPService {

    public String saveFile(MultipartFile multipartFile);

    public int delFile(String fileName) throws Exception;

}
