package com.flange.store.console.service.impl;

import com.flange.store.console.service.SFTPService;
import com.flange.store.model.UmsAdmin;
import com.flange.store.util.IdUtil;
import com.flange.store.util.SFTPUtil;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;

/**
 * @author flangely
 * @create 2019-03-23
 * <p>
 * 11:52 AM
 */
@Service
public class SFTPServiceImpl implements SFTPService {

    @Autowired
    private SFTPUtil sftpUtil;

    @Value("${sftp.location}")
    private String sftpLocation;

    @Value("${image.server.url}")
    private String imgUrlPrefix;

    @Override
    public synchronized String saveFile(MultipartFile multipartFile) {
        CommonsMultipartFile cmFile = (CommonsMultipartFile) multipartFile;
        DiskFileItem fileItem = (DiskFileItem) cmFile.getFileItem();
        String s = fileItem.getName();
        File file = fileItem.getStoreLocation();
        String exName = fileItem.getName().substring(fileItem.getName().lastIndexOf("."), fileItem.getName().length());
        String fileName = IdUtil.getGeneralID() + exName;
        if (sftpUtil.uploadFile(sftpLocation + fileName, file.getPath()) == -1){
            throw new RuntimeException();
        }
        return  imgUrlPrefix + "/" + fileName;

    }

}
