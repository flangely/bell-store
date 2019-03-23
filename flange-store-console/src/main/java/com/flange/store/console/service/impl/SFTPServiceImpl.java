package com.flange.store.console.service.impl;

import com.flange.store.console.service.SFTPService;
import com.flange.store.model.UmsAdmin;
import com.flange.store.util.SFTPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
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

    @Override
    public String saveFile(MultipartFile multipartFile, UmsAdmin user) {
        
    }

}
