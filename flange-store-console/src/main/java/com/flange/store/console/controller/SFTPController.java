package com.flange.store.console.controller;

import com.flange.store.console.dto.CommonResult;
import com.flange.store.console.service.SFTPService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author flangely
 * @create 2019-03-23
 * <p> 图片管理接口
 * 6:52 PM
 */
@Controller
@RequestMapping("/image")
public class SFTPController {

    private static Logger LOG = LoggerFactory.getLogger(SFTPController.class);

    @Autowired
    private SFTPService sftpService;

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Object uploadImg(@RequestParam(value = "file") MultipartFile file){

        try {
            String imgUrl = sftpService.saveFile(file);
            return new CommonResult().success(imgUrl);
        }catch (Exception e){
            LOG.error(e.getMessage());
            return new CommonResult().failed();
        }
    }

}
